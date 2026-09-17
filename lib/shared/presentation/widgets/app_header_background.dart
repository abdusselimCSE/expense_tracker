import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/features/dashboard/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppHeaderBackground extends StatelessWidget {
  final double height;

  const AppHeaderBackground({
    super.key,
    this.height = 287,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // purple background
          ClipPath(
            clipper: BackgroundImageClipper(),
            child: Container(
              height: 287,
              color: AppConstants.primaryColor,
            ),
          ),

          // decorative circles
          Positioned(
            top: -15,
            left: -55,

            child: CircularShapes(
              size: 212,
              strokeWidth: 20,
            ),
          ),
          Positioned(
            top: -15,
            left: 59,

            child: CircularShapes(
              size: 127,
              strokeWidth: 15,
            ),
          ),
          Positioned(
            top: -22,
            left: 127,

            child: CircularShapes(
              size: 85,
              strokeWidth: 8,
              gradientRotation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
