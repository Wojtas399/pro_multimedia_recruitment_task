import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../title_large.dart';

class Slide1Title extends StatelessWidget {
  const Slide1Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleLarge(context.str.slide1LeadingText),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleLarge(
              context.str.slide1BoldedText,
              fontWeight: FontWeight.bold,
            ),
            const TitleLarge('!'),
          ],
        ),
      ],
    );
  }
}
