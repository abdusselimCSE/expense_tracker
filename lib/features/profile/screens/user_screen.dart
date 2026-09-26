import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/shared/presentation/widgets/app_back_button.dart';
import 'package:expense_tracker/shared/presentation/widgets/notification_icon.dart';
import 'package:expense_tracker/shared/presentation/widgets/profile_settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 211,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Center(
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(color: Color(0xffF1F1F1), shape: BoxShape.circle),
                      child: Transform.translate(
                        offset: const Offset(0, 12),
                        child: Image.asset(
                          "assets/icons/profile/Woman.png",
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Enjelin Morgeana",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff222222),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "@enjelin_morgeana",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppConstants.primaryColor,
                  ),
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
                        onTap: () {},
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
