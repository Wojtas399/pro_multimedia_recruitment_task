import 'package:flutter/material.dart';

class Slide4Title extends StatelessWidget {
  const Slide4Title({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
        );
    return Column(
      children: [
        Text(
          'Ustawiaj',
          style: textStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'przypomnienia',
              style: textStyle?.copyWith(
                fontWeight: FontWeight.bold,
              ),
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
