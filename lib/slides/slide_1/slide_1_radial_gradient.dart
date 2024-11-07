import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../slides/slide_radial_gradient.dart';

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
        Orientation.portrait => -140,
        Orientation.landscape => -60,
      },
      left: switch (context.deviceOrientation) {
        Orientation.portrait => -8,
        Orientation.landscape => -5,
      },
      right: 0,
      bottom: 0,
      child: SlideRadialGradient(
        opacityAndScaleAnim: opacityAndScaleAnim,
      ),
    );
  }
}
