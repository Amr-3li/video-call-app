import 'package:flutter/material.dart';

class PageAnimations {
  // Fade Animation - Simple fix
  static PageRouteBuilder fade(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Add CurvedAnimation - this fixes both directions!
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        return FadeTransition(opacity: curvedAnimation, child: child);
      },
    );
  }

  // Slide Animation - Simple fix
  static PageRouteBuilder slide(
    Widget page, {
    Offset begin = const Offset(1.0, 0.0),
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        final tween = Tween(begin: begin, end: Offset.zero);
        final offsetAnimation = curvedAnimation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  // Combined Slide and Fade Animation
  static PageRouteBuilder routeTransition(
    Widget page, {
    Offset begin = const Offset(1.0, 0.0),
  }) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.bounceOut,
          reverseCurve: Curves.decelerate,
        );

        final tween = Tween(begin: begin, end: Offset.zero);
        final offsetAnimation = curvedAnimation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(opacity: curvedAnimation, child: child),
        );
      },
    );
  }
}
