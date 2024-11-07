import 'package:flutter/material.dart';

import '../../title_large.dart';

class Slide3Title extends StatelessWidget {
  const Slide3Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TitleLarge('Poznawaj'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleLarge('nieodkryte '),
            TitleLarge(
              'szlaki',
              fontWeight: FontWeight.bold,
            ),
            TitleLarge('!'),
          ],
        ),
      ],
    );
  }
}
