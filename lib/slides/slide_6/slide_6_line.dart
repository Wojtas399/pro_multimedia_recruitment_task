import 'package:flutter/material.dart';

import '../../animated_path_service.dart';
import '../../extensions/build_context_extensions.dart';
import '../../path_service.dart';

class Slide6Line extends StatelessWidget {
  final double maxWidth;
  final Animation<double> animation;

  const Slide6Line({
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
    final points = switch (orientation) {
      Orientation.portrait => [
          Offset(maxWidth, 0),
          Offset(maxWidth * .35, 0),
          Offset(maxWidth * .14, 0),
          Offset(maxWidth * .14, 73),
          Offset(maxWidth * .35, 73),
          Offset(maxWidth - 120, 73),
          Offset(maxWidth - 85, 73),
          Offset(maxWidth - 85, 100),
          Offset(maxWidth - 120, 100),
          Offset(maxWidth * .41, 100),
        ],
      Orientation.landscape => [
          Offset(maxWidth, 0),
          Offset(maxWidth * .11, 0),
          Offset(maxWidth * .01, 0),
          Offset(maxWidth * .01, 39),
          Offset(maxWidth * .12, 39),
          Offset(maxWidth - 100, 39),
          Offset(maxWidth - 80, 39),
          Offset(maxWidth - 80, 54),
          Offset(maxWidth - 100, 54),
          Offset(maxWidth * .46, 54),
        ],
    };
    final path = PathService().generateSnakeLinePath(points);
    final animatedPath =
        AnimatedPathService().createAnimatedPath(path, animationPercent);
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;
    canvas.drawPath(animatedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}
