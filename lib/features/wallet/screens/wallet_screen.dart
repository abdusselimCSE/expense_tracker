import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/shared/presentation/widgets/app_back_button.dart';
import 'package:expense_tracker/shared/presentation/widgets/notification_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 24),
        backgroundColor: Colors.transparent,
        title: Text(
          "Wallet",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: AppBackButton(
          onTap: () => context.go('/home'),
        ),
        centerTitle: true,
        actions: [
          NotificationIcon(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 165),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                spreadRadius: 0,
                blurRadius: 38.95,
                offset: Offset(0, 24.48),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),

          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                "Total Balance",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppConstants.secondaryTextColor,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "\$ 00.00",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff222222),
                  letterSpacing: -0.05,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          final router = GoRouter.of(context);

                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: 'Dismiss',
                            barrierColor: Colors.black.withValues(alpha: 0.45),
                            transitionDuration: const Duration(milliseconds: 400),

                            pageBuilder: (context, animation, secondaryAnimation) {
                              return SafeArea(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 24,
                                      right: 24,
                                      bottom: 120,
                                    ),

                                    // Material ONLY covers the dialog
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        width: double.infinity,
                                        height: 355,
                                        padding: const EdgeInsets.all(24),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            width: 1,
                                            color: AppConstants.primaryColor,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Select an option",
                                              style: TextTheme.of(context).titleMedium!.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),

                                            const SizedBox(height: 24),

                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                router.push('/wallet/connect-wallet');
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Cards",
                                                    style: TextTheme.of(context).titleMedium!.copyWith(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  SvgPicture.asset(
                                                    "assets/illustrations/wallet/credit_card.svg",
                                                  ),
                                                ],
                                              ),
                                            ),

                                            const SizedBox(height: 8),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Bank Account",
                                                  style: TextTheme.of(context).titleMedium!.copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SvgPicture.asset(
                                                  "assets/illustrations/wallet/bank_account.svg",
                                                ),
                                              ],
                                            ),

                                            const SizedBox(height: 8),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Others",
                                                  style: TextTheme.of(context).titleMedium!.copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SvgPicture.asset(
                                                  "assets/illustrations/wallet/cash.svg",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },

                            transitionBuilder:
                                (
                                  context,
                                  animation,
                                  secondaryAnimation,
                                  child,
                                ) {
                                  final slideAnimation = CurvedAnimation(
                                    parent: animation,

                                    // smooth entrance with tiny settling effect
                                    curve: const Cubic(0.16, 1.02, 0.30, 1.0),

                                    // smooth downward dismissal
                                    reverseCurve: Curves.easeInCubic,
                                  );

                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0, 1.2),
                                      end: Offset.zero,
                                    ).animate(slideAnimation),
                                    child: child,
                                  );
                                },
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppConstants.primaryColor,
                              width: 1,
                            ),
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/wallet/add.svg",
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Add",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppConstants.primaryColor,
                            width: 1,
                          ),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/wallet/qr_code.svg",
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Pay",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),

                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppConstants.primaryColor,
                            width: 1,
                          ),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/wallet/send.svg",
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Send",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
