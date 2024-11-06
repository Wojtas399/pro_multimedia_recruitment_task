import 'package:flutter/material.dart';

import '../extensions/build_context_extensions.dart';
import '../radial_gradient.dart';

class Slide4RadialGradient extends StatelessWidget {
  final Animation<double> opacityAndScaleAnim;

  const Slide4RadialGradient({
    super.key,
    required this.opacityAndScaleAnim,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: switch (context.deviceOrientation) {
        Orientation.portrait => -70,
        Orientation.landscape => -30,
      },
      left: 0,
      right: switch (context.deviceOrientation) {
        Orientation.portrait => -65,
        Orientation.landscape => -35,
      },
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
                  Orientation.portrait => .32,
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
