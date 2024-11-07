import 'package:flutter/material.dart';

class SlideAnimatedPositionAndOpacity extends StatelessWidget {
  final Animation<double> positionAnimation;
  final Animation<double> opacityAnimation;
  final Widget child;

  const SlideAnimatedPositionAndOpacity({
    super.key,
    required this.positionAnimation,
    required this.opacityAnimation,
    required this.child,
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
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}
