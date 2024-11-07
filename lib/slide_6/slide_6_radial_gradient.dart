import 'package:flutter/material.dart';

import '../extensions/build_context_extensions.dart';
import '../slides/slide_radial_gradient.dart';

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
      child: SlideRadialGradient(
        opacityAndScaleAnim: opacityAndScaleAnim,
      ),
    );
  }
}
