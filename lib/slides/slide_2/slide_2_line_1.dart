import 'package:flutter/material.dart';

import '../../animated_path_service.dart';

class Slide2Line1 extends StatelessWidget {
  final double maxWidth;
  final Animation<double> animation;

  const Slide2Line1({
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
      ),
    );
  }
}

class _LinePainter extends CustomPainter {
  final double maxWidth;
  final Animation<double> animation;

  const _LinePainter({
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
    path.lineTo(maxWidth / 2, 0);
    final animatedPath =
        AnimatedPathService().createAnimatedPath(path, animationPercent);
    canvas.drawPath(animatedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
