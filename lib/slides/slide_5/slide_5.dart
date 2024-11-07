import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../slides/slide_skeleton.dart';
import 'slide_5_title.dart';

class Slide5 extends StatelessWidget {
  const Slide5({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideSkeleton(
      radialGradientOffset: switch (context.deviceOrientation) {
        Orientation.portrait => const Offset(30, -50),
        Orientation.landscape => const Offset(18, -42),
      },
      title: const Slide5Title(),
      imagePath: 'assets/6.png',
    );
  }
}
