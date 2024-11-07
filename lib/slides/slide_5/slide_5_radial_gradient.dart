import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../slides/slide_radial_gradient.dart';

class Slide5RadialGradient extends StatelessWidget {
  final Animation<double> opacityAndScaleAnim;

  const Slide5RadialGradient({
    super.key,
    required this.opacityAndScaleAnim,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: switch (context.deviceOrientation) {
        Orientation.portrait => -80,
        Orientation.landscape => -50,
      },
      left: 0,
      right: switch (context.deviceOrientation) {
        Orientation.portrait => -40,
        Orientation.landscape => -25,
      },
      bottom: 0,
      child: SlideRadialGradient(
        opacityAndScaleAnim: opacityAndScaleAnim,
      ),
    );
  }
}
