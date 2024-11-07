import 'package:flutter/material.dart';

import '../../title_large.dart';

class Slide2Title extends StatelessWidget {
  const Slide2Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TitleLarge(
          'Bierz udział',
          fontWeight: FontWeight.bold,
        ),
        TitleLarge('w wydarzeniach!'),
      ],
    );
  }
}
