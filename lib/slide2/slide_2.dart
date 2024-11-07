import 'dart:async';

import 'package:flutter/material.dart';

import '../extensions/build_context_extensions.dart';
import '../slides/slide_image.dart';
import '../slides_actions.dart';
import 'slide_2_line_1.dart';
import 'slide_2_line_2.dart';
import 'slide_2_radial_gradient.dart';
import 'slide_2_title.dart';

class Slide2 extends StatefulWidget {
  const Slide2({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Slide2> with TickerProviderStateMixin {
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
        Slide2RadialGradient(
          opacityAndScaleAnim: _radialGradientOpacityAndScaleAnim,
        ),
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.red,
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
                const SizedBox(height: 16),
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
      bottom: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Slide2Line1(
            maxWidth: constraints.maxWidth,
            animation: line1Animation,
          ),
          SizedBox(
            height: switch (context.deviceOrientation) {
              Orientation.portrait => 140,
              Orientation.landscape => 84,
            },
          ),
          Slide2Line2(
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
          Slide2Title(
            positionAnimation: titlePositionAnim,
            opacityAnimation: titleAndImageOpacityAnim,
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SlideImage(
                imagePath: 'assets/3.png',
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
