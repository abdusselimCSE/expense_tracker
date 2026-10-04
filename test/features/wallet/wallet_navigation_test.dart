import 'package:expense_tracker/app/navigation/app_router.dart';
import 'package:expense_tracker/features/wallet/screens/connect_wallet_screen.dart';
import 'package:expense_tracker/features/wallet/screens/wallet_screen.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    appRouter.go('/splash');
  });

  testWidgets('Cards option opens the Cards tab', (tester) async {
    await _openConnectWalletFromOption(tester, 'Cards');

    expect(_selectedConnectWalletTab(tester), 0);
  });

  testWidgets('Bank Account option opens the Accounts tab', (tester) async {
    await _openConnectWalletFromOption(tester, 'Bank Account');

    expect(_selectedConnectWalletTab(tester), 1);
  });
}

Future<void> _openConnectWalletFromOption(
  WidgetTester tester,
  String option,
) async {
  tester.view.physicalSize = const Size(480, 915);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(const MyApp());
  appRouter.go('/wallet');
  await tester.pumpAndSettle();

  expect(find.byType(WalletScreen), findsOneWidget);
  await tester.tap(find.byType(InkWell).first);
  await tester.pumpAndSettle();

  expect(find.text('Select an option'), findsOneWidget);
  await tester.tap(find.text(option));
  await tester.pumpAndSettle();

  expect(find.text('Select an option'), findsNothing);
  expect(find.byType(ConnectWalletScreen), findsOneWidget);
}

int _selectedConnectWalletTab(WidgetTester tester) {
  final tabBarContext = tester.element(find.byType(TabBar));
  return DefaultTabController.of(tabBarContext).index;
}
