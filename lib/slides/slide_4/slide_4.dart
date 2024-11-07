import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../slides/slide_skeleton.dart';
import 'slide_4_title.dart';

class Slide4 extends StatelessWidget {
  const Slide4({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideSkeleton(
      radialGradientOffset: switch (context.deviceOrientation) {
        Orientation.portrait => const Offset(65, -20),
        Orientation.landscape => const Offset(40, -3),
      },
      title: const Slide4Title(),
      imagePath: 'assets/5.png',
    );
  }
}
