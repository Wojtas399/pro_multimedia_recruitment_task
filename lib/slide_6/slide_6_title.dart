import 'package:flutter/material.dart';

import '../slides/slide_animated_position_and_opacity.dart';

class Slide6Title extends StatelessWidget {
  final Animation<double> positionAnimation;
  final Animation<double> opacityAnimation;

  const Slide6Title({
    super.key,
    required this.positionAnimation,
    required this.opacityAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return SlideAnimatedPositionAndOpacity(
      positionAnimation: positionAnimation,
      opacityAnimation: opacityAnimation,
      child: const _Text(),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
        );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Złap ',
          style: textStyle,
        ),
        Text(
          'swój rytm',
          style: textStyle?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '!',
          style: textStyle,
        ),
      ],
    );
  }
}
