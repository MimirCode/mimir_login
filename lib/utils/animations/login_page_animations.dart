import 'package:flutter/material.dart';

class EnterAnimation {
  late AnimationController controller;
  late Animation<double> circleSize;

  EnterAnimation(this.controller) {
    circleSize = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOutBack),
    );
  }
}
