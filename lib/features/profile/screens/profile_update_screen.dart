import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/features/profile/data/profile_data.dart';
import 'package:expense_tracker/features/profile/widgets/profile_identity_header.dart';
import 'package:expense_tracker/shared/presentation/widgets/app_back_button.dart';
import 'package:expense_tracker/shared/presentation/widgets/notification_icon.dart';
import 'package:flutter/material.dart';

class ProfileUpdateScreen extends StatelessWidget {
  const ProfileUpdateScreen({super.key});

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
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListView(
                    key: const ValueKey("profileUpdateFieldsList"),
                    padding: const EdgeInsets.only(bottom: 24, top: 10),
                    children: [
                      const _ProfileUpdateField(
                        label: "Name",
                        initialValue: currentProfileName,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 26),
                      const _ProfileUpdateField(
                        label: "Email",
                        initialValue: currentProfileEmail,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 26),
                      const _ProfileUpdateField(
                        label: "Password",
                        initialValue: "**********",
                        suffixIcon: IconButton(
                          tooltip: "Show password",
                          onPressed: null,
                          icon: Icon(
                            Icons.visibility,
                            color: Color(0xff6A707C),
                            size: 22,
                          ),
                        ),
                      ),
                      const SizedBox(height: 26),
                      const _ProfileUpdateField(
                        label: "Number of cards",
                        initialValue: "$currentProfileCardCount",
                        keyboardType: TextInputType.number,
                        readOnly: true,
                      ),
                      const SizedBox(height: 26),
                      const _ProfileUpdateField(
                        label: "Number of Bank Accounts",
                        initialValue: "$currentProfileBankAccountCount",
                        keyboardType: TextInputType.number,
                        readOnly: true,
                      ),
                      const SizedBox(height: 28),
                      Align(
                        child: SizedBox(
                          height: 50,
                          child: FilledButton(
                            onPressed: () => FocusScope.of(context).unfocus(),
                            child: Text(
                              "Update profile",
                              style: TextTheme.of(context).labelLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileUpdateField extends StatelessWidget {
  static const _outline = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: AppConstants.primaryColor,
      width: 1.4,
    ),
  );

  final String label;
  final String initialValue;
  final TextInputType? keyboardType;
  final bool readOnly;
  final Widget? suffixIcon;

  const _ProfileUpdateField({
    required this.label,
    required this.initialValue,
    this.keyboardType,
    this.readOnly = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final inputTheme = Theme.of(context).inputDecorationTheme;

    return SizedBox(
      height: 54,
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        readOnly: readOnly,
        style: TextTheme.of(context).titleMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: inputTheme.hintStyle,
          floatingLabelStyle: inputTheme.hintStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          border: _outline,
          enabledBorder: _outline,
          focusedBorder: _outline.copyWith(
            borderSide: const BorderSide(
              color: AppConstants.primaryColor,
              width: 1.4,
            ),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
