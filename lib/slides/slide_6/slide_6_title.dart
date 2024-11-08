import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../title_large.dart';

class Slide6Title extends StatelessWidget {
  const Slide6Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleLarge('${context.str.slide6LeadingText} '),
        TitleLarge(
          context.str.slide6BoldedText,
          fontWeight: FontWeight.bold,
        ),
        const TitleLarge('!'),
      ],
    );
  }
}
