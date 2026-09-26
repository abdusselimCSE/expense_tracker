import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileSettingsTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;
  const ProfileSettingsTile({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 30,
      // minTileHeight: 60,
      leading: SizedBox.square(
        dimension: 30,
        child: SvgPicture.asset(
          iconPath,
        ),
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
