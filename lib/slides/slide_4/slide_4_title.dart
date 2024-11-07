import 'package:flutter/material.dart';

import '../../title_large.dart';

class Slide4Title extends StatelessWidget {
  const Slide4Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TitleLarge('Ustawiaj'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleLarge(
              'przypomnienia',
              fontWeight: FontWeight.bold,
            ),
            TitleLarge('!'),
          ],
        ),
      ],
    );
  }
}
