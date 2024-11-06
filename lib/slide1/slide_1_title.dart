import 'package:flutter/material.dart';

class Slide1Title extends StatelessWidget {
  final Animation<double> positionAnimation;
  final Animation<double> opacityAnimation;

  const Slide1Title({
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
    return SizedBox(
      width: 150,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
          children: [
            const TextSpan(
              text: 'Spędzaj czas',
            ),
            TextSpan(
              text: ' kreatywnie',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            const TextSpan(
              text: '!',
            )
          ],
        ),
      ),
    );
  }
}
