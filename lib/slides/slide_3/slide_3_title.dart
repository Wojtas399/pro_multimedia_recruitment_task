import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../title_large.dart';

class Slide3Title extends StatelessWidget {
  const Slide3Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleLarge(context.str.slide3LeadingFirstLineText),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleLarge('${context.str.slide3LeadingSecondLineText} '),
            TitleLarge(
              context.str.slide3BoldedText,
              fontWeight: FontWeight.bold,
            ),
            const TitleLarge('!'),
          ],
        ),
      ],
    );
  }
}
