import 'package:flutter/material.dart';

import '../animated_path_service.dart';

class Slide1Line1 extends CustomPainter {
  final double maxWidth;
  final Animation<double> animation;

  const Slide1Line1({
    required this.maxWidth,
    required this.animation,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = animation.value;
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(maxWidth, 0);
    final animatedPath =
        AnimatedPathService().createAnimatedPath(path, animationPercent);
    canvas.drawPath(animatedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
