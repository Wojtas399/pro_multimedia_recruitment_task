import 'package:flutter/material.dart';

class Slide5Title extends StatelessWidget {
  final Animation<double> positionAnimation;
  final Animation<double> opacityAnimation;

  const Slide5Title({
    super.key,
    required this.positionAnimation,
    required this.opacityAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: positionAnimation,
      builder: (_, __) {
        return AnimatedBuilder(
          animation: opacityAnimation,
          builder: (_, __) {
            return Transform.translate(
              offset: Offset(positionAnimation.value, 0),
              child: Opacity(
                opacity: opacityAnimation.value,
                child: const Center(
                  child: _Text(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
        );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Bądź ',
          style: textStyle,
        ),
        Text(
          'na bieżąco',
          style: textStyle?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '!',
          style: textStyle,
        ),
      ],
    );
  }
}
