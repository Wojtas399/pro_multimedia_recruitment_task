import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../slides/slide_skeleton.dart';
import 'slide_1_line_1.dart';
import 'slide_1_line_2.dart';
import 'slide_1_title.dart';

class Slide1 extends StatefulWidget {
  const Slide1({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Slide1> with TickerProviderStateMixin {
  late AnimationController _line1AnimController;
  late AnimationController _line2AnimController;
  late Animation<double> _line1Anim;
  late Animation<double> _line2Anim;

  @override
  void initState() {
    const curves = Curves.easeInOut;
    _initializeLine1Anim(curves);
    _initializeLine2Anim(curves);
    _line1AnimController.forward();
    _line2AnimController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _line1AnimController.dispose();
    _line2AnimController.dispose();
    super.dispose();
  }

  void _initializeLine1Anim(Cubic curves) {
    _line1AnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _line1Anim = CurvedAnimation(
      parent: _line1AnimController,
      curve: curves,
    );
  }

  void _initializeLine2Anim(Cubic curves) {
    _line2AnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _line2Anim = CurvedAnimation(
      parent: _line2AnimController,
      curve: curves,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideSkeleton(
      radialGradientOffset: switch (context.deviceOrientation) {
        Orientation.portrait => const Offset(0, -45),
        Orientation.landscape => const Offset(0, -10),
      },
      title: const Slide1Title(),
      imagePath: 'assets/2.png',
      linesBuilder: (BoxConstraints constraints) {
        return _AnimatedLines(
          line1Animation: _line1Anim,
          line2Animation: _line2Anim,
          constraints: constraints,
        );
      },
      imageBottomPadding: switch (context.deviceOrientation) {
        Orientation.portrait => 55,
        Orientation.landscape => 29,
      },
    );
  }
}

class _AnimatedLines extends StatelessWidget {
  final Animation<double> line1Animation;
  final Animation<double> line2Animation;
  final BoxConstraints constraints;

  const _AnimatedLines({
    required this.line1Animation,
    required this.line2Animation,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: switch (context.deviceOrientation) {
        Orientation.portrait => 110,
        Orientation.landscape => 60,
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Slide1Line1(
            maxWidth: constraints.maxWidth,
            animation: line1Animation,
          ),
          SizedBox(
            height: switch (context.deviceOrientation) {
              Orientation.portrait => 21,
              Orientation.landscape => 11,
            },
          ),
          Slide1Line2(
            maxWidth: constraints.maxWidth,
            animation: line2Animation,
          ),
        ],
      ),
    );
  }
}
