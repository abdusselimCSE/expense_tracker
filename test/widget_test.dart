import 'package:expense_tracker/app/navigation/app_router.dart';
import 'package:expense_tracker/app/presentation/screens/splash_screen.dart';
import 'package:expense_tracker/features/dashboard/screens/home_screen.dart';
import 'package:expense_tracker/features/profile/screens/user_screen.dart';
import 'package:expense_tracker/features/reports/screens/statistics_screen.dart';
import 'package:expense_tracker/features/wallet/screens/wallet_screen.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    appRouter.go('/splash');
  });

  testWidgets('Startup displays splash then opens the home screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.text('Total Balance'), findsNothing);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.byType(SplashScreen), findsNothing);
    expect(find.text('Total Balance'), findsOneWidget);
    expect(find.text('Transactions History'), findsOneWidget);
    expect(find.text('Upwork'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Bottom navigation switches tabs and returns home', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    appRouter.go('/home');
    await tester.pumpAndSettle();

    for (final tab in <String, Type>{
      'Chart': StatisticsScreen,
      'Wallet': WalletScreen,
      'User': UserScreen,
    }.entries) {
      await tester.tap(find.byTooltip(tab.key));
      await tester.pumpAndSettle();
      expect(find.byType(tab.value), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsNothing);
      if (tab.key == 'Chart') {
        expect(find.text(r'$1,230'), findsOneWidget);
      }
    }

    await tester.tap(find.byTooltip('Home'));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Home displays Bangla translations', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(locale: Locale('bn')));
    appRouter.go('/home');
    await tester.pumpAndSettle();
    expect(find.text('মোট ব্যালেন্স'), findsOneWidget);
    expect(find.text('আয়'), findsOneWidget);
    expect(find.text('ব্যয়'), findsOneWidget);
    expect(find.text('Total Balance'), findsNothing);
    expect(find.text('Income'), findsNothing);
    expect(find.text('Expenses'), findsNothing);
  });

  testWidgets('Removing splash cancels its delayed navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 4));
    expect(tester.takeException(), isNull);
  });
}
