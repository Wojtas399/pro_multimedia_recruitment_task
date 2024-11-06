import 'package:flutter/material.dart';

import '../extensions/build_context_extensions.dart';
import '../radial_gradient.dart';

class Slide1RadialGradient extends StatelessWidget {
  final Animation<double> opacityAndScaleAnim;

  const Slide1RadialGradient({
    super.key,
    required this.opacityAndScaleAnim,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: switch (context.deviceOrientation) {
        Orientation.portrait => -114,
        Orientation.landscape => -60,
      },
      left: 0,
      right: 0,
      bottom: 0,
      child: AnimatedBuilder(
        animation: opacityAndScaleAnim,
        builder: (_, __) {
          return Opacity(
            opacity: opacityAndScaleAnim.value,
            child: Transform.scale(
              scale: opacityAndScaleAnim.value,
              child: CustomRadialGradient(
                radius: switch (context.deviceOrientation) {
                  Orientation.portrait => .35,
                  Orientation.landscape => .19,
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
