import 'package:flutter/material.dart';

class MyCustomRouteTransition extends PageRouteBuilder {
  MyCustomRouteTransition({required Widget route})
    : super(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return route;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final fadeInAnimation = Tween<double>(
            begin: 0,
            end: 1,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));

          return FadeTransition(
            opacity: fadeInAnimation,
            child: child,
          );
        },
      );
}
