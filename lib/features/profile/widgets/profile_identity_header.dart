import 'package:expense_tracker/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ProfileIdentityHeader extends StatelessWidget {
  final String name;
  final String username;
  final String avatarAsset;

  const ProfileIdentityHeader({
    super.key,
    required this.name,
    required this.username,
    required this.avatarAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipOval(
          clipBehavior: Clip.antiAlias,
          child: Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              color: Color(0xffF1F1F1),
              shape: BoxShape.circle,
            ),
            child: Transform.translate(
              offset: const Offset(0, 12),
              child: Image.asset(
                avatarAsset,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff222222),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          username,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppConstants.primaryColor,
          ),
        ),
      ],
    );
  }
}
