import 'package:flutter/material.dart';

class Slide1Title extends StatelessWidget {
  const Slide1Title({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
        );
    return Column(
      children: [
        Text(
          'Spędzaj czas',
          style: textStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'kreatywnie',
              style: textStyle?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              '!',
              style: textStyle,
            ),
          ],
        ),
      ],
    );
  }
}
