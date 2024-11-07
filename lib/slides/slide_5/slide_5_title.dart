import 'package:flutter/material.dart';

import '../../title_large.dart';

class Slide5Title extends StatelessWidget {
  const Slide5Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleLarge('Bądź '),
        TitleLarge(
          'na bieżąco',
          fontWeight: FontWeight.bold,
        ),
        TitleLarge('!'),
      ],
    );
  }
}
