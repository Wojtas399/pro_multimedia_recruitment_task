import 'package:flutter/material.dart';

import 'slide_1_image.dart';
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
  late AnimationController _radialGradientController;
  late AnimationController _line1AnimationController;
  late AnimationController _line2AnimationController;
  late AnimationController _imageAndTextPositionAnimController;
  late AnimationController _imageAndTextOpacityAnimController;
  late Animation<double> _line1Anim;
  late Animation<double> _line2Anim;
  late Animation<double> _radialGradientOpacityAndScaleAnim;
  late Animation<double> _imageAndTextPositionAnim;
  late Animation<double> _imageAndTextOpacityAnim;

  @override
  void initState() {
    const curves = Curves.easeInOut;
    _initializeRadialAnimation(curves);
    _initializeLine1Anim(curves);
    _initializeLine2Anim(curves);
    _initializeImageAndTextAnim(curves);
    _radialGradientController.forward().whenComplete(
      () {
        _imageAndTextPositionAnimController.forward();
        _imageAndTextOpacityAnimController.forward();
      },
    );
    _line1AnimationController.forward();
    _line2AnimationController.forward();
    super.initState();
  }

  void _initializeRadialAnimation(Cubic curves) {
    _radialGradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _radialGradientOpacityAndScaleAnim =
        Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _radialGradientController,
        curve: curves,
      ),
    );
  }

  void _initializeLine1Anim(Cubic curves) {
    _line1AnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _line1Anim = CurvedAnimation(
      parent: _line1AnimationController,
      curve: curves,
    );
  }

  void _initializeLine2Anim(Cubic curves) {
    _line2AnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _line2Anim = CurvedAnimation(
      parent: _line2AnimationController,
      curve: curves,
    );
  }

  void _initializeImageAndTextAnim(Cubic curves) {
    _imageAndTextPositionAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _imageAndTextOpacityAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _imageAndTextPositionAnim = Tween<double>(begin: -800, end: 0).animate(
      CurvedAnimation(
        parent: _imageAndTextPositionAnimController,
        curve: curves,
      ),
    );
    _imageAndTextOpacityAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _imageAndTextOpacityAnimController,
        curve: curves,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: -150,
            left: 0,
            child: Slide1RadialGradient(
              opacityAndScaleAnim: _radialGradientOpacityAndScaleAnim,
            ),
          ),
          Positioned(
            top: 403,
            left: 0,
            right: 0,
            child: CustomPaint(
              painter: Slide1Line1(
                maxWidth: MediaQuery.of(context).size.width,
                animation: _line1Anim,
              ),
            ),
          ),
          Positioned(
            top: 428,
            left: 0,
            right: 0,
            child: CustomPaint(
              painter: Slide1Line2(
                maxWidth: MediaQuery.of(context).size.width,
                animation: _line2Anim,
              ),
            ),
          ),
          Slide1Image(
            positionAnimation: _imageAndTextPositionAnim,
            opacityAnimation: _imageAndTextOpacityAnim,
          ),
          Slide1Title(
            positionAnimation: _imageAndTextPositionAnim,
            opacityAnimation: _imageAndTextOpacityAnim,
          ),
        ],
      ),
    );
  }
}
