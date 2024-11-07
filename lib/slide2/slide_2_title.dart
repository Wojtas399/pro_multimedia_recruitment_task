import 'package:flutter/material.dart';

class Slide2Title extends StatelessWidget {
  const Slide2Title({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
        );
    return Column(
      children: [
        Text(
          'Bierz udział',
          style: textStyle?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'w wydarzeniach!',
          style: textStyle,
        ),
      ],
    );
  }
}
