import 'dart:async';
import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/core/navigation/fade_page_route.dart';
import 'package:expense_tracker/screens/connect_wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> fadeAnimation;
  Timer? splashTimer;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    fadeAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        Navigator.of(
          context,
        ).pushReplacement(
          MyCustomRouteTransition(
            route: const ConnectWalletScreen(),
          ),
        );
      }
    });

    splashTimer = Timer(Duration(seconds: 3), () {
      if (mounted) {
        controller.forward();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    splashTimer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: SvgPicture.asset(
            AppConstants().splashLogo,
          ),
        ),
      ),
    );
  }
}
