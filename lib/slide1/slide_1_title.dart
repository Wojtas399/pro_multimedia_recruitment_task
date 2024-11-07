import 'package:flutter/material.dart';

import '../title_large.dart';

class Slide1Title extends StatelessWidget {
  const Slide1Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TitleLarge('Spędzaj czas'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleLarge(
              'kreatywnie',
              fontWeight: FontWeight.bold,
            ),
            TitleLarge('!'),
          ],
        ),
      ],
    );
  }
}
