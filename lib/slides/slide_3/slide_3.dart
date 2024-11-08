import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../slides/slide_skeleton.dart';
import 'slide_3_line.dart';
import 'slide_3_title.dart';

class Slide3 extends StatefulWidget {
  const Slide3({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Slide3> with TickerProviderStateMixin {
  late AnimationController _lineAnimController;
  late Animation<double> _lineAnim;

  @override
  void initState() {
    const curves = Curves.easeInOut;
    _initializeLineAnim(curves);
    _lineAnimController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _lineAnimController.dispose();
    super.dispose();
  }

  void _initializeLineAnim(Cubic curves) {
    _lineAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _lineAnim = CurvedAnimation(
      parent: _lineAnimController,
      curve: curves,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideSkeleton(
      radialGradientOffset: switch (context.deviceOrientation) {
        Orientation.portrait => const Offset(18, -15),
        Orientation.landscape => const Offset(15, -1),
      },
      title: const Slide3Title(),
      imagePath: 'assets/4.png',
      linesBuilder: (BoxConstraints constraints) {
        return Positioned(
          bottom: switch (context.deviceOrientation) {
            Orientation.portrait => 140,
            Orientation.landscape => 85,
          },
          child: Slide3Line(
            maxWidth: constraints.maxWidth,
            animation: _lineAnim,
          ),
        );
      },
    );
  }
}
