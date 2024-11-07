import 'package:flutter/material.dart';

import 'slide_animated_position_and_opacity.dart';

class SlideImage extends StatelessWidget {
  final String imagePath;
  final Animation<double> positionAnimation;
  final Animation<double> opacityAnimation;

  const SlideImage({
    super.key,
    required this.imagePath,
    required this.positionAnimation,
    required this.opacityAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return SlideAnimatedPositionAndOpacity(
      positionAnimation: positionAnimation,
      opacityAnimation: opacityAnimation,
      child: Image.asset(imagePath),
    );
  }
}
