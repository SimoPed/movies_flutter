import 'package:flutter/cupertino.dart';

class AnimationPageRoute extends PageRouteBuilder {
  final Widget widget;

  AnimationPageRoute({required this.widget})
      : super(
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation =
                CurvedAnimation(parent: animation, curve: Curves.elasticOut);

            return ScaleTransition(
              scale: animation,
              alignment: Alignment.center,
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) {
            return widget;
          },
        );
}
