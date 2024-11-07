import 'package:flutter/material.dart';

class Slide3Title extends StatelessWidget {
  const Slide3Title({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
        );
    return Column(
      children: [
        Text(
          'Poznawaj',
          style: textStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'nieodkryte ',
              style: textStyle,
            ),
            Text(
              'szlaki',
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
