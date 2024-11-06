import 'package:flutter/material.dart';

import '../extensions/build_context_extensions.dart';
import '../radial_gradient.dart';

class Slide6RadialGradient extends StatelessWidget {
  final Animation<double> opacityAndScaleAnim;

  const Slide6RadialGradient({
    super.key,
    required this.opacityAndScaleAnim,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: switch (context.deviceOrientation) {
        Orientation.portrait => -85,
        Orientation.landscape => -60,
      },
      left: 0,
      right: switch (context.deviceOrientation) {
        Orientation.portrait => -75,
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
