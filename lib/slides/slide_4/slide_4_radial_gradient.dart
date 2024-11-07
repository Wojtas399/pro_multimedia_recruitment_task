import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../slides/slide_radial_gradient.dart';

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
      child: SlideRadialGradient(
        opacityAndScaleAnim: opacityAndScaleAnim,
      ),
    );
  }
}
