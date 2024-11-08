import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../title_large.dart';

class Slide5Title extends StatelessWidget {
  const Slide5Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleLarge('${context.str.slide5LeadingText} '),
        TitleLarge(
          context.str.slide5BoldedText,
          fontWeight: FontWeight.bold,
        ),
        const TitleLarge('!'),
      ],
    );
  }
}
