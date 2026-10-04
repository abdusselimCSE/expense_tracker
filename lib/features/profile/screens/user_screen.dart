import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/core/localization/locale_controller.dart';
import 'package:expense_tracker/features/profile/data/profile_data.dart';
import 'package:expense_tracker/features/profile/widgets/profile_identity_header.dart';
import 'package:expense_tracker/l10n/app_localizations.dart';
import 'package:expense_tracker/shared/presentation/widgets/app_back_button.dart';
import 'package:expense_tracker/shared/presentation/widgets/notification_icon.dart';
import 'package:expense_tracker/shared/presentation/widgets/profile_settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: AppBackButton(
          onTap: () => context.go('/home'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: NotificationIcon(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 211, bottom: 24),
        child: Column(
          children: [
            ProfileIdentityHeader(
              name: currentProfileName,
              username: currentProfileUsername,
              avatarAsset: currentProfileAvatarAsset,
            ),

            // Invite Friends
            Padding(
              padding: const EdgeInsets.only(
                top: 34,
                left: 25,
                right: 25,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xffF0F6F5),
                        radius: 25,
                        child: Image.asset(
                          "assets/icons/profile/diamond.png",
                          width: 33,
                          height: 27,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'Invite Friends',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xffEEEEEE),
                  ),
                ],
              ),
            ),

            // Settings
            Padding(
              padding: const EdgeInsets.only(
                left: 34,
                right: 34,
                top: 0,
              ),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  ProfileSettingsTile(
                    title: "Account info",
                    iconPath: "assets/icons/profile/user-fill.svg",
                    onTap: () => context.push('/profile/account-info'),
                  ),
                  SizedBox(height: 16),
                  ProfileSettingsTile(
                    title: "Login and security",
                    iconPath: "assets/icons/profile/shield-checkered-fll.svg",
                    onTap: () {},
                  ),
                  SizedBox(height: 16),
                  ProfileSettingsTile(
                    title: "Data and privacy",
                    iconPath: "assets/icons/profile/lock-key-fill.svg",
                    onTap: () {},
                  ),
                  SizedBox(height: 16),
                  ProfileSettingsTile(
                    title: l10n.language,
                    leading: const Icon(
                      Icons.language,
                      color: AppConstants.secondaryTextColor,
                      size: 28,
                    ),
                    onTap: () => _showLanguageSelector(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showLanguageSelector(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = Localizations.localeOf(context);
    final selectedLocale = await showModalBottomSheet<Locale>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        final languages = [
          (locale: const Locale('en'), label: l10n.english),
          (locale: const Locale('bn'), label: l10n.bangla),
        ];

        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.chooseLanguage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                for (final language in languages)
                  ListTile(
                    key: ValueKey(
                      'languageOption-${language.locale.languageCode}',
                    ),
                    contentPadding: EdgeInsets.zero,
                    title: Text(language.label),
                    trailing: currentLocale.languageCode == language.locale.languageCode
                        ? const Icon(
                            Icons.check_rounded,
                            color: AppConstants.primaryColor,
                          )
                        : null,
                    onTap: () {
                      Navigator.of(sheetContext).pop(language.locale);
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );

    if (!context.mounted || selectedLocale == null) {
      return;
    }

    LocaleScope.of(context).setLocale(selectedLocale);
  }
}
