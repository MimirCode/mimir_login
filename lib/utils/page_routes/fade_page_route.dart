import 'package:flutter/material.dart';

class FadePageRoute extends PageRouteBuilder {
  final Widget child;

  FadePageRoute(this.child)
      : super(
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (context, Animation<double> animation,
                Animation<double> secondAnimation, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, secondAnimation) {
              return child;
            });
}
