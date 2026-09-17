import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  final String iconPath;

  const SocialLoginButton({
    super.key,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61.53,
      width: 110,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xffE8DEF8),
          width: 1.1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset(
        iconPath,
        width: 28.57,
        height: 28.57,
      ),
    );
  }
}
