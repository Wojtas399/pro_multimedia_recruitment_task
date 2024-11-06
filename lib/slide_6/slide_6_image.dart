import 'package:flutter/material.dart';

class Slide6Image extends StatelessWidget {
  final Animation<double> positionAnimation;
  final Animation<double> opacityAnimation;

  const Slide6Image({
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
            return Transform.translate(
              offset: Offset(positionAnimation.value, 0),
              child: Opacity(
                opacity: opacityAnimation.value,
                child: Image.asset('assets/1.png'),
              ),
            );
          },
        );
      },
    );
  }
}
