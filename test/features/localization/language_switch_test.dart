import 'package:expense_tracker/app/navigation/app_router.dart';
import 'package:expense_tracker/features/dashboard/screens/home_screen.dart';
import 'package:expense_tracker/features/profile/screens/user_screen.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    appRouter.go('/splash');
  });

  testWidgets('Language setting changes the application locale', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const MyApp());
    appRouter.go('/profile');
    await tester.pumpAndSettle();

    expect(find.byType(UserScreen), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Language'),
      100,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.tap(find.text('Language'));
    await tester.pumpAndSettle();

    expect(find.text('Choose language'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('languageOption-bn')));
    await tester.pumpAndSettle();

    expect(find.text('ভাষা'), findsOneWidget);

    appRouter.go('/home');
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('লেনদেনের ইতিহাস'), findsOneWidget);
    expect(find.text('Transactions History'), findsNothing);

    appRouter.go('/profile');
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('ভাষা'),
      100,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.tap(find.text('ভাষা'));
    await tester.pumpAndSettle();

    expect(find.text('ভাষা নির্বাচন করুন'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('languageOption-en')));
    await tester.pumpAndSettle();

    appRouter.go('/home');
    await tester.pumpAndSettle();

    expect(find.text('Transactions History'), findsOneWidget);
    expect(find.text('লেনদেনের ইতিহাস'), findsNothing);
  });
}
