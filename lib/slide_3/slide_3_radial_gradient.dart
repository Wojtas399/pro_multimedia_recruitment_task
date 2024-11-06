import 'package:flutter/material.dart';

import '../extensions/build_context_extensions.dart';
import '../radial_gradient.dart';

class Slide3RadialGradient extends StatelessWidget {
  final Animation<double> opacityAndScaleAnim;

  const Slide3RadialGradient({
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
            child: CustomRadialGradient(
              radius: switch (context.deviceOrientation) {
                Orientation.portrait => .32,
                Orientation.landscape => .24,
              },
            ),
          ),
        );
      },
    );
  }
}
