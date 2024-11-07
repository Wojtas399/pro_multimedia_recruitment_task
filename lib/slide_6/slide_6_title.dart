import 'package:flutter/material.dart';

class Slide6Title extends StatelessWidget {
  const Slide6Title({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
        );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Złap ',
          style: textStyle,
        ),
        Text(
          'swój rytm',
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
