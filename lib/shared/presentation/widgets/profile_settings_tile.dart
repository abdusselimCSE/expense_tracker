import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileSettingsTile extends StatelessWidget {
  final String title;
  final String? iconPath;
  final Widget? leading;
  final VoidCallback onTap;

  const ProfileSettingsTile({
    super.key,
    required this.title,
    this.iconPath,
    this.leading,
    required this.onTap,
  }) : assert(
         iconPath != null || leading != null,
         'Provide either iconPath or leading.',
       );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 30,
      // minTileHeight: 60,
      leading: SizedBox.square(
        dimension: 30,
        child: leading ?? SvgPicture.asset(iconPath!),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}
