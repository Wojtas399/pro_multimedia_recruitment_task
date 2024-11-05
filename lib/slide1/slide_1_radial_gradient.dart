import 'package:flutter/material.dart';

import '../radial_gradient.dart';

class Slide1RadialGradient extends StatelessWidget {
  final Animation<double> opacityAndScaleAnim;

  const Slide1RadialGradient({
    super.key,
    required this.opacityAndScaleAnim,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: opacityAndScaleAnim,
      builder: (_, __) {
        return Opacity(
          opacity: opacityAndScaleAnim.value,
          child: Transform.scale(
            scale: opacityAndScaleAnim.value,
            child: const CustomRadialGradient(),
          ),
        );
      },
    );
  }
}
