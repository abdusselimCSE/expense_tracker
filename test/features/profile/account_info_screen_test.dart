import 'package:expense_tracker/app/navigation/app_router.dart';
import 'package:expense_tracker/features/profile/screens/account_info.dart';
import 'package:expense_tracker/features/profile/screens/profile_update_screen.dart';
import 'package:expense_tracker/features/profile/screens/user_screen.dart';
import 'package:expense_tracker/features/profile/widgets/profile_identity_header.dart';
import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/shared/presentation/widgets/app_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    appRouter.go('/splash');
  });

  testWidgets('Account info opens the Profile Info top section', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const MyApp());
    appRouter.go('/profile');
    await tester.pumpAndSettle();

    await tester.tap(find.text('Account info'));
    await tester.pumpAndSettle();

    expect(find.byType(AccountInfoScreen), findsOneWidget);
    expect(find.byType(ProfileIdentityHeader), findsOneWidget);
    expect(find.text('Enjelin Morgeana'), findsNWidgets(2));
    expect(find.text('@enjelin_morgeana'), findsOneWidget);
    expect(find.byTooltip('User'), findsOneWidget);
    expect(find.text('Profile information'), findsOneWidget);
    expect(find.byTooltip('Edit profile'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('enjelinmorgeana@gmail.com'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('**********'), findsOneWidget);
    expect(find.byTooltip('Show password'), findsOneWidget);
    expect(find.text('Number of cards'), findsOneWidget);

    final identityTop = tester.getTopLeft(find.byType(ProfileIdentityHeader));
    final sectionTitleTop = tester.getTopLeft(
      find.text('Profile information'),
    );

    await tester.scrollUntilVisible(
      find.text('Number of Bank Accounts'),
      250,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.pumpAndSettle();

    expect(find.text('Number of Bank Accounts'), findsOneWidget);
    expect(
      tester.getTopLeft(find.byType(ProfileIdentityHeader)),
      identityTop,
    );
    expect(
      tester.getTopLeft(find.text('Profile information')),
      sectionTitleTop,
    );
    expect(tester.takeException(), isNull);

    await tester.tap(find.byType(AppBackButton));
    await tester.pumpAndSettle();

    expect(find.byType(UserScreen), findsOneWidget);
  });

  testWidgets('Edit profile opens the Profile Update shell', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const MyApp());
    appRouter.go('/profile');
    await tester.pumpAndSettle();

    await tester.tap(find.text('Account info'));
    await tester.pumpAndSettle();
    final profileInfoIdentityTop = tester.getTopLeft(
      find.byType(ProfileIdentityHeader),
    );
    await tester.tap(find.byTooltip('Edit profile'));
    await tester.pumpAndSettle();

    expect(find.byType(ProfileUpdateScreen), findsOneWidget);
    expect(find.byType(ProfileIdentityHeader), findsOneWidget);
    expect(find.text('Enjelin Morgeana'), findsNWidgets(2));
    expect(find.text('@enjelin_morgeana'), findsOneWidget);
    expect(
      tester.getTopLeft(find.byType(ProfileIdentityHeader)),
      profileInfoIdentityTop,
    );
    expect(find.byTooltip('User'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('enjelinmorgeana@gmail.com'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('**********'), findsOneWidget);
    expect(find.byTooltip('Show password'), findsOneWidget);
    expect(find.text('Number of cards'), findsOneWidget);
    expect(tester.getSize(find.byType(TextFormField).first).height, 54);

    final nameField = tester.widget<TextField>(
      find
          .descendant(
            of: find.byType(TextFormField).first,
            matching: find.byType(TextField),
          )
          .first,
    );
    expect(
      nameField.decoration?.contentPadding,
      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );

    await tester.scrollUntilVisible(
      find.text('Update profile'),
      250,
      scrollable: find
          .descendant(
            of: find.byKey(const ValueKey('profileUpdateFieldsList')),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    await tester.pumpAndSettle();

    expect(find.text('Number of Bank Accounts'), findsOneWidget);
    expect(
      find.widgetWithText(FilledButton, 'Update profile'),
      findsOneWidget,
    );
    expect(
      tester.getTopLeft(find.byType(ProfileIdentityHeader)),
      profileInfoIdentityTop,
    );
    expect(tester.takeException(), isNull);

    await tester.tap(find.byType(AppBackButton));
    await tester.pumpAndSettle();

    expect(find.byType(AccountInfoScreen), findsOneWidget);
  });
}
