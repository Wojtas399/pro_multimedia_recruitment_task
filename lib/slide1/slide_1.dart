import 'dart:async';

import 'package:flutter/material.dart';

import '../extensions/build_context_extensions.dart';
import '../slides/slide_animated_position_and_opacity.dart';
import '../slides/slide_image.dart';
import '../slides_actions.dart';
import 'slide_1_line_1.dart';
import 'slide_1_line_2.dart';
import 'slide_1_radial_gradient.dart';
import 'slide_1_title.dart';

class Slide1 extends StatefulWidget {
  const Slide1({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Slide1> with TickerProviderStateMixin {
  late AnimationController _radialGradientAnimController;
  late AnimationController _line1AnimController;
  late AnimationController _line2AnimController;
  late AnimationController _titleAndImagePositionAnimController;
  late AnimationController _titleAndImageOpacityAnimController;
  late Animation<double> _line1Anim;
  late Animation<double> _line2Anim;
  late Animation<double> _radialGradientOpacityAndScaleAnim;
  late Animation<double> _textPositionAnim;
  late Animation<double> _imagePositionAnim;
  late Animation<double> _imageAndTextOpacityAnim;

  @override
  void initState() {
    const curves = Curves.easeInOut;
    _initializeRadialAnimation(curves);
    _initializeLine1Anim(curves);
    _initializeLine2Anim(curves);
    _initializeImageAndTextAnim(curves);
    _radialGradientAnimController.forward();
    _line1AnimController.forward();
    _line2AnimController.forward();
    Timer(
      const Duration(milliseconds: 500),
      () {
        _titleAndImagePositionAnimController.forward();
        _titleAndImageOpacityAnimController.forward();
      },
    );
    super.initState();
  }

  void _initializeRadialAnimation(Cubic curves) {
    _radialGradientAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _radialGradientOpacityAndScaleAnim =
        Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _radialGradientAnimController,
        curve: curves,
      ),
    );
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

  void _initializeImageAndTextAnim(Cubic curves) {
    _titleAndImagePositionAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _titleAndImageOpacityAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _textPositionAnim = Tween<double>(begin: -800, end: 0).animate(
      CurvedAnimation(
        parent: _titleAndImagePositionAnimController,
        curve: curves,
      ),
    );
    _imagePositionAnim = Tween<double>(begin: 800, end: 0).animate(
      CurvedAnimation(
        parent: _titleAndImagePositionAnimController,
        curve: curves,
      ),
    );
    _imageAndTextOpacityAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _titleAndImageOpacityAnimController,
        curve: curves,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Slide1RadialGradient(
          opacityAndScaleAnim: _radialGradientOpacityAndScaleAnim,
        ),
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: SizedBox(
                    width: double.infinity,
                    child: LayoutBuilder(
                      builder: (_, BoxConstraints constraints) {
                        return Stack(
                          children: [
                            _AnimatedLines(
                              line1Animation: _line1Anim,
                              line2Animation: _line2Anim,
                              constraints: constraints,
                            ),
                            _AnimatedTitleAndImage(
                              titleAndImageOpacityAnim:
                                  _imageAndTextOpacityAnim,
                              titlePositionAnim: _textPositionAnim,
                              imagePositionAnim: _imagePositionAnim,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SlidesActions(
                  onNextPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
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
        Orientation.portrait => 125,
        Orientation.landscape => 71,
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

class _AnimatedTitleAndImage extends StatelessWidget {
  final Animation<double> titleAndImageOpacityAnim;
  final Animation<double> titlePositionAnim;
  final Animation<double> imagePositionAnim;

  const _AnimatedTitleAndImage({
    required this.titleAndImageOpacityAnim,
    required this.titlePositionAnim,
    required this.imagePositionAnim,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SlideAnimatedPositionAndOpacity(
            positionAnimation: titlePositionAnim,
            opacityAnimation: titleAndImageOpacityAnim,
            child: const Slide1Title(),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: (switch (context.deviceOrientation) {
                  Orientation.portrait => 70,
                  Orientation.landscape => 40,
                }),
              ),
              child: SlideImage(
                imagePath: 'assets/2.png',
                positionAnimation: imagePositionAnim,
                opacityAnimation: titleAndImageOpacityAnim,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
