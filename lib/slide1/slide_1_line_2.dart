import 'package:flutter/material.dart';

import '../animated_path_service.dart';

class Slide1Line2 extends CustomPainter {
  final double maxWidth;
  final Animation<double> animation;

  const Slide1Line2({
    required this.maxWidth,
    required this.animation,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = animation.value;
    const double heightSpaceBetweenLines = 55;
    const double widthReturnStartStop = 125;
    const double widthReturnPeak = 40;
    final points = [
      Offset.zero,
      Offset(maxWidth - widthReturnStartStop, 0),
      Offset(maxWidth - widthReturnPeak, 0),
      Offset(maxWidth - widthReturnPeak, heightSpaceBetweenLines),
      Offset(maxWidth - widthReturnStartStop, heightSpaceBetweenLines),
      const Offset(widthReturnStartStop, heightSpaceBetweenLines),
      const Offset(widthReturnPeak, heightSpaceBetweenLines),
      const Offset(widthReturnPeak, heightSpaceBetweenLines * 2),
      const Offset(widthReturnStartStop, heightSpaceBetweenLines * 2),
      Offset(maxWidth, heightSpaceBetweenLines * 2),
    ];
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;
    final path = Path();
    path.moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length - 2; i++) {
      double xc = (points[i].dx + points[i + 1].dx) / 2;
      double yc = (points[i].dy + points[i + 1].dy) / 2;
      path.quadraticBezierTo(points[i].dx, points[i].dy, xc, yc);
    }
    path.quadraticBezierTo(
      points[points.length - 2].dx,
      points[points.length - 2].dy,
      points[points.length - 1].dx,
      points[points.length - 1].dy,
    );
    final animatedPath =
        AnimatedPathService().createAnimatedPath(path, animationPercent);
    canvas.drawPath(animatedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}
