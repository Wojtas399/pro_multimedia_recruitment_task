import 'package:flutter/material.dart';

import '../../title_large.dart';

class Slide6Title extends StatelessWidget {
  const Slide6Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleLarge('Złap '),
        TitleLarge(
          'swój rytm',
          fontWeight: FontWeight.bold,
        ),
        TitleLarge('!'),
      ],
    );
  }
}
