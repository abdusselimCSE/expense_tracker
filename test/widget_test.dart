import 'package:expense_tracker/l10n/app_localizations.dart';
import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/app/presentation/screens/splash_screen.dart';
import 'package:expense_tracker/app/presentation/layouts/screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
    expect(find.text('Input your expenses'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Bottom navigation switches tabs and returns home', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale('en'),
        home: ScreenLayout(),
      ),
    );
    await tester.pumpAndSettle();

    for (final tab in {
      'Chart': 'This is chart page',
      'Wallet': 'Wallet page',
      'User': 'User page',
    }.entries) {
      await tester.tap(find.byTooltip(tab.key));
      await tester.pumpAndSettle();
      expect(find.text(tab.value), findsOneWidget);
      expect(find.text('Total Balance'), findsNothing);
      expect(find.byType(FloatingActionButton), findsNothing);
    }

    await tester.tap(find.byTooltip('Home'));
    await tester.pumpAndSettle();
    expect(find.text('Total Balance'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Home displays Bangla translations', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale('bn'),
        home: ScreenLayout(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('মোট ব্যালেন্স'), findsOneWidget);
    expect(find.text('আয়'), findsOneWidget);
    expect(find.text('ব্যয়'), findsOneWidget);
    expect(find.text('আপনার খরচ লিখুন'), findsOneWidget);
    expect(find.text('Total Balance'), findsNothing);
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
