import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../title_large.dart';

class Slide4Title extends StatelessWidget {
  const Slide4Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleLarge(context.str.slide4LeadingText),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleLarge(
              context.str.slide4BoldedText,
              fontWeight: FontWeight.bold,
            ),
            const TitleLarge('!'),
          ],
        ),
      ],
    );
  }
}
