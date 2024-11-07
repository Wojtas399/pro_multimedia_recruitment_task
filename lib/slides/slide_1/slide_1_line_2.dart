import 'package:flutter/material.dart';

import '../../animated_path_service.dart';
import '../../extensions/build_context_extensions.dart';
import '../../path_service.dart';

class Slide1Line2 extends StatelessWidget {
  final double maxWidth;
  final Animation<double> animation;

  const Slide1Line2({
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
    const double widthReturnStartStop = 125;
    const double widthReturnPeak = 40;
    final points = [
      Offset.zero,
      Offset(maxWidth - widthReturnStartStop, 0),
      Offset(maxWidth - widthReturnPeak, 0),
      Offset(maxWidth - widthReturnPeak, heightSpaceBetweenLines),
      Offset(maxWidth - widthReturnStartStop, heightSpaceBetweenLines),
      Offset(widthReturnStartStop, heightSpaceBetweenLines),
      Offset(widthReturnPeak, heightSpaceBetweenLines),
      Offset(widthReturnPeak, heightSpaceBetweenLines * 2),
      Offset(widthReturnStartStop, heightSpaceBetweenLines * 2),
      Offset(maxWidth, heightSpaceBetweenLines * 2),
    ];
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
