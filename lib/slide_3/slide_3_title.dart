import 'package:flutter/material.dart';

import '../slides/slide_animated_position_and_opacity.dart';

class Slide3Title extends StatelessWidget {
  final Animation<double> positionAnimation;
  final Animation<double> opacityAnimation;

  const Slide3Title({
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
          'Poznawaj',
          style: textStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'nieodkryte ',
              style: textStyle,
            ),
            Text(
              'szlaki',
              style: textStyle?.copyWith(
                fontWeight: FontWeight.bold,
              ),
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
