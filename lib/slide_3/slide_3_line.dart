import 'package:flutter/material.dart';

import '../animated_path_service.dart';
import '../extensions/build_context_extensions.dart';

class Slide3Line extends StatelessWidget {
  final double maxWidth;
  final Animation<double> animation;

  const Slide3Line({
    super.key,
    required this.maxWidth,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _LinePainter(
        maxWidth: maxWidth,
        animation: animation,
        orientation: context.deviceOrientation,
      ),
    );
  }
}

class _LinePainter extends CustomPainter {
  final double maxWidth;
  final Animation<double> animation;
  final Orientation orientation;

  const _LinePainter({
    required this.maxWidth,
    required this.animation,
    required this.orientation,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = animation.value;
    final double heightSpaceBetweenLines = switch (orientation) {
      Orientation.portrait => 57,
      Orientation.landscape => 32,
    };
    final double endLinePercentage = switch (orientation) {
      Orientation.portrait => .75,
      Orientation.landscape => .605,
    };
    final points = [
      Offset.zero,
      Offset(maxWidth - 125, 0),
      Offset(maxWidth - 40, 0),
      Offset(maxWidth - 40, heightSpaceBetweenLines),
      Offset(maxWidth - 125, heightSpaceBetweenLines),
      Offset(155, heightSpaceBetweenLines),
      Offset(70, heightSpaceBetweenLines),
      Offset(70, heightSpaceBetweenLines * 2),
      Offset(155, heightSpaceBetweenLines * 2),
      Offset(maxWidth * endLinePercentage, heightSpaceBetweenLines * 2),
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
