import 'package:flutter/material.dart';

import '../extensions/build_context_extensions.dart';

class SlideRadialGradient extends StatelessWidget {
  final Animation<double> opacityAndScaleAnim;

  const SlideRadialGradient({
    super.key,
    required this.opacityAndScaleAnim,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: opacityAndScaleAnim,
      builder: (_, __) {
        return Opacity(
          opacity: opacityAndScaleAnim.value,
          child: Transform.scale(
            scale: opacityAndScaleAnim.value,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: switch (context.deviceOrientation) {
                    Orientation.portrait => .32,
                    Orientation.landscape => .19,
                  },
                  colors: [
                    const Color(0xFFC3E3FF),
                    Theme.of(context).scaffoldBackgroundColor
                    // Colors.red,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
