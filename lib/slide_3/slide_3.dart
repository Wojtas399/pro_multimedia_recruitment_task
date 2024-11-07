import 'dart:async';

import 'package:flutter/material.dart';

import '../extensions/build_context_extensions.dart';
import '../slides/slide_image.dart';
import '../slides_actions.dart';
import 'slide_3_line.dart';
import 'slide_3_radial_gradient.dart';
import 'slide_3_title.dart';

class Slide3 extends StatefulWidget {
  const Slide3({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Slide3> with TickerProviderStateMixin {
  late AnimationController _radialGradientAnimController;
  late AnimationController _lineAnimController;
  late AnimationController _titleAndImagePositionAnimController;
  late AnimationController _titleAndImageOpacityAnimController;
  late Animation<double> _lineAnim;
  late Animation<double> _radialGradientOpacityAndScaleAnim;
  late Animation<double> _textPositionAnim;
  late Animation<double> _imagePositionAnim;
  late Animation<double> _imageAndTextOpacityAnim;

  @override
  void initState() {
    const curves = Curves.easeInOut;
    _initializeRadialAnimation(curves);
    _initializeLineAnim(curves);
    _initializeImageAndTextAnim(curves);
    _radialGradientAnimController.forward();
    _lineAnimController.forward();
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
        Slide3RadialGradient(
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
                            Positioned(
                              bottom: switch (context.deviceOrientation) {
                                Orientation.portrait => 140,
                                Orientation.landscape => 85,
                              },
                              child: Slide3Line(
                                maxWidth: constraints.maxWidth,
                                animation: _lineAnim,
                              ),
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
          Slide3Title(
            positionAnimation: titlePositionAnim,
            opacityAnimation: titleAndImageOpacityAnim,
          ),
          const SizedBox(height: 24),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SlideImage(
                imagePath: 'assets/4.png',
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
