import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color color;

  const AppBackButton({
    super.key,
    this.onTap,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? context.pop,
      child: Center(
        child: SvgPicture.asset(
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.srcIn,
          ),
          "assets/icons/shared/chevron_left.svg",
        ),
      ),
    );
  }
}
