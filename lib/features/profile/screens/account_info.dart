import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/features/profile/data/profile_data.dart';
import 'package:expense_tracker/features/profile/widgets/profile_identity_header.dart';
import 'package:expense_tracker/shared/presentation/widgets/app_back_button.dart';
import 'package:expense_tracker/shared/presentation/widgets/notification_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: const AppBackButton(),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: NotificationIcon(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 211),
        child: Column(
          children: [
            const ProfileIdentityHeader(
              name: currentProfileName,
              username: currentProfileUsername,
              avatarAsset: currentProfileAvatarAsset,
            ),
            const SizedBox(height: 34),
            Expanded(
              child: Center(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _ProfileInformationSection(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileInformationSection extends StatelessWidget {
  const _ProfileInformationSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                "Profile information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff222222),
                ),
              ),
            ),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xffF2EDF7),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.16),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                tooltip: "Edit profile",
                onPressed: () => context.push('/profile/account-info/update'),
                icon: const Icon(
                  Icons.edit_rounded,
                  color: AppConstants.primaryColor,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView(
            key: const ValueKey("profileInfoFieldsList"),
            padding: const EdgeInsets.only(bottom: 24),
            children: [
              const _ProfileInfoItem(
                label: "Name",
                value: currentProfileName,
              ),
              const SizedBox(height: 16),
              const _ProfileInfoItem(
                label: "Email",
                value: currentProfileEmail,
              ),
              const SizedBox(height: 16),
              _ProfileInfoItem(
                label: "Password",
                value: "**********",
                trailing: IconButton(
                  tooltip: "Show password",
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility,
                    color: Color(0xff6A707C),
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const _ProfileInfoItem(
                label: "Number of cards",
                value: "$currentProfileCardCount",
              ),
              const SizedBox(height: 16),
              const _ProfileInfoItem(
                label: "Number of Bank Accounts",
                value: "$currentProfileBankAccountCount",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final Widget? trailing;

  const _ProfileInfoItem({
    required this.label,
    required this.value,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppConstants.secondaryTextColor,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                value,
                style: TextTheme.of(context).titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        ?trailing,
      ],
    );
  }
}
