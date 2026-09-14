import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/utils/screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenLayout(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Center(
              child: SvgPicture.asset(
                "assets/images/Icon.svg",
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},

            style: IconButton.styleFrom(
              backgroundColor: const Color(0x14FFFFFF),
              foregroundColor: Colors.white,
              fixedSize: const Size(
                40,
                40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            icon: Stack(
              children: [
                Icon(
                  Icons.notifications_outlined,
                ),
                Positioned(
                  top: 3,
                  left: 13,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFB48F),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Container(
                                  width: 380,
                                  height: 355,
                                  padding: EdgeInsets.all(24),
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
                                        style:
                                            TextTheme.of(
                                              context,
                                            ).titleMedium!.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      SizedBox(height: 24),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Cards",
                                            style:
                                                TextTheme.of(
                                                  context,
                                                ).titleMedium!.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          SvgPicture.asset(
                                            "assets/icons/emoji _credit card_.svg",
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Bank Account",
                                            style:
                                                TextTheme.of(
                                                  context,
                                                ).titleMedium!.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          SvgPicture.asset(
                                            "assets/icons/icon _bank account_.svg",
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Others",
                                            style:
                                                TextTheme.of(
                                                  context,
                                                ).titleMedium!.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          SvgPicture.asset(
                                            "assets/icons/illustration _bitcoin cash money_.svg",
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                    ],
                                  ),
                                ),
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
                            "assets/images/wallet_page_icons/plus_fill.svg",
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
                          "assets/images/wallet_page_icons/qr_code_fill.svg",
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
                          "assets/images/wallet_page_icons/paper_plane_tilt_fill.svg",
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
