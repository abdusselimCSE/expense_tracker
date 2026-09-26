import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
    );
  }
}
