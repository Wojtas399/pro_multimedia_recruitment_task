import 'dart:async';

import 'package:flutter/material.dart';

import 'slide_animated_position_and_opacity.dart';
import 'slide_image.dart';
import 'slide_radial_gradient.dart';

class SlideSkeleton extends StatefulWidget {
  final Widget title;
  final String imagePath;
  final Widget Function(BoxConstraints)? linesBuilder;
  final Offset radialGradientOffset;
  final double imageBottomPadding;

  const SlideSkeleton({
    super.key,
    required this.title,
    required this.imagePath,
    this.linesBuilder,
    this.radialGradientOffset = const Offset(0, 0),
    this.imageBottomPadding = 20,
  });

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<SlideSkeleton> with TickerProviderStateMixin {
  late AnimationController _radialGradientAnimController;
  late AnimationController _titleAndImagePositionAnimController;
  late AnimationController _titleAndImageOpacityAnimController;
  late Animation<double> _radialGradientOpacityAndScaleAnim;
  late Animation<double> _titlePositionAnim;
  late Animation<double> _imagePositionAnim;
  late Animation<double> _titleAndImageOpacityAnim;
  late Timer _titleAndImageTriggerTimer;

  @override
  void initState() {
    const curves = Curves.easeInOut;
    _initializeRadialAnimation(curves);
    _initializeImageAndTextAnim(curves);
    _radialGradientAnimController.forward();
    _titleAndImageTriggerTimer = Timer(
      const Duration(milliseconds: 500),
      () {
        _titleAndImagePositionAnimController.forward();
        _titleAndImageOpacityAnimController.forward();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _titleAndImageTriggerTimer.cancel();
    _radialGradientAnimController.dispose();
    _titleAndImagePositionAnimController.dispose();
    _titleAndImageOpacityAnimController.dispose();
    super.dispose();
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

  void _initializeImageAndTextAnim(Cubic curves) {
    _titleAndImagePositionAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _titleAndImageOpacityAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _titlePositionAnim = Tween<double>(begin: -800, end: 0).animate(
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
    _titleAndImageOpacityAnim = Tween<double>(begin: 0, end: 1).animate(
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
        Transform.translate(
          offset: widget.radialGradientOffset,
          child: SlideRadialGradient(
            opacityAndScaleAnim: _radialGradientOpacityAndScaleAnim,
          ),
        ),
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              width: double.infinity,
              child: LayoutBuilder(
                builder: (_, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      if (widget.linesBuilder != null)
                        widget.linesBuilder!(constraints),
                      _TitleAndImage(
                        title: SlideAnimatedPositionAndOpacity(
                          positionAnimation: _titlePositionAnim,
                          opacityAnimation: _titleAndImageOpacityAnim,
                          child: widget.title,
                        ),
                        image: SlideImage(
                          imagePath: widget.imagePath,
                          positionAnimation: _imagePositionAnim,
                          opacityAnimation: _titleAndImageOpacityAnim,
                        ),
                        bottomPadding: widget.imageBottomPadding,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TitleAndImage extends StatelessWidget {
  final Widget title;
  final Widget image;
  final double bottomPadding;

  const _TitleAndImage({
    required this.title,
    required this.image,
    required this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          title,
          const SizedBox(height: 8),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: bottomPadding,
              ),
              child: image,
            ),
          ),
        ],
      ),
    );
  }
}
