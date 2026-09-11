import 'dart:math' as math;
import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.goodAfternoon,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Enjelin Morgeana",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                ],
              ),
            ),

            SizedBox(height: 33),
            SizedBox(
              height: 202,
              child: BalanceCard(),
            ),
            SizedBox(height: 70),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Text(
                    l10n.inputYourExpenses,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: const Color(0xff79747E),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isBangla = Localizations.localeOf(context).languageCode == 'bn';

    final numberFormat = NumberFormat(
      isBangla ? "#,##,##0.00" : "#,##0.00",
      isBangla ? 'bn' : 'en_US',
    );
    final currencySymbol = isBangla ? '৳' : r'$';

    return Container(
      padding: EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Color(0xff65558F),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppConstants.primaryColor.withValues(alpha: 0.18),
            blurRadius: 25,
            spreadRadius: 0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          l10n.totalBalance,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 5),

                        Icon(
                          Icons.keyboard_arrow_up,
                          color: Color(0xffEEEEEE),
                          size: 18,
                        ),
                      ],
                    ),
                    Text(
                      "$currencySymbol ${numberFormat.format(100.00)}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.05,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: SvgPicture.asset(
                      "assets/images/navigation_bar_icons/more_icon.svg",
                      width: 21,
                      height: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(
                            alpha: 0.15,
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_downward_sharp,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        l10n.income,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffD0E5E4),
                          letterSpacing: 0.05,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "$currencySymbol ${numberFormat.format(100.00)}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.05,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(
                            alpha: 0.15,
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_upward_sharp,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        l10n.expenses,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffD0E5E4),
                          letterSpacing: 0.05,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "$currencySymbol ${numberFormat.format(100.00)}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.05,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircularShapes extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final double gradientRotation;

  const CircularShapes({
    super.key,
    required this.size,
    required this.strokeWidth,
    this.gradientRotation = -math.pi,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.10,
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.all(strokeWidth),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            transform: GradientRotation(gradientRotation),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(255, 255, 255, 0.0),
              Color.fromRGBO(255, 255, 255, 0.7),
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppConstants.primaryColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class BackgroundImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double xCoordinate = size.width;
    double yCoordinate = size.height;

    path.lineTo(0, yCoordinate - 20);

    path.quadraticBezierTo(
      xCoordinate / 2,
      yCoordinate + 20,
      xCoordinate,
      yCoordinate - 20,
    );

    path.lineTo(xCoordinate, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
