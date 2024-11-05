import 'package:flutter/material.dart';

class Slide1Image extends StatelessWidget {
  final Animation<double> positionAnimation;
  final Animation<double> opacityAnimation;

  const Slide1Image({
    super.key,
    required this.positionAnimation,
    required this.opacityAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: positionAnimation,
      builder: (_, __) {
        return AnimatedBuilder(
          animation: opacityAnimation,
          builder: (_, __) {
            return Positioned(
              top: -120,
              left: 0,
              right: positionAnimation.value,
              bottom: 0,
              child: Opacity(
                opacity: opacityAnimation.value,
                child: Image.asset('assets/2.png'),
              ),
            );
          },
        );
      },
    );
  }
}
