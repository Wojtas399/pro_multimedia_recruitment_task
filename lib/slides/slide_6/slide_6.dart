import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../slides/slide_skeleton.dart';
import 'slide_6_line.dart';
import 'slide_6_title.dart';

class Slide6 extends StatefulWidget {
  const Slide6({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Slide6> with TickerProviderStateMixin {
  late AnimationController _lineAnimController;
  late Animation<double> _lineAnim;

  @override
  void initState() {
    const curves = Curves.easeInOut;
    _initializeLineAnim(curves);
    _lineAnimController.forward();
    super.initState();
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
        Orientation.portrait => const Offset(45, -13),
        Orientation.landscape => const Offset(25, -5),
      },
      title: const Slide6Title(),
      imagePath: 'assets/1.png',
      linesBuilder: (BoxConstraints constraints) {
        return Positioned(
          bottom: switch (context.deviceOrientation) {
            Orientation.portrait => 128,
            Orientation.landscape => 78,
          },
          child: Slide6Line(
            maxWidth: constraints.maxWidth,
            animation: _lineAnim,
          ),
        );
      },
    );
  }
}
