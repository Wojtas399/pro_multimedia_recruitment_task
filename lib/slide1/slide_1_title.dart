import 'package:flutter/material.dart';

import '../slides/slide_animated_position_and_opacity.dart';

class Slide1Title extends StatelessWidget {
  final Animation<double> positionAnimation;
  final Animation<double> opacityAnimation;

  const Slide1Title({
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
    return Column(
      children: [
        Text(
          'Spędzaj czas',
          style: textStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'kreatywnie',
              style: textStyle?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              '!',
              style: textStyle,
            ),
          ],
        ),
      ],
    );
  }
}
