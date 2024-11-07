import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../slides/slide_radial_gradient.dart';

class Slide2RadialGradient extends StatelessWidget {
  final Animation<double> opacityAndScaleAnim;

  const Slide2RadialGradient({
    super.key,
    required this.opacityAndScaleAnim,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: switch (context.deviceOrientation) {
        Orientation.portrait => -50,
        Orientation.landscape => -45,
      },
      bottom: 0,
      child: SlideRadialGradient(
        opacityAndScaleAnim: opacityAndScaleAnim,
      ),
    );
  }
}
