import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../title_large.dart';

class Slide2Title extends StatelessWidget {
  const Slide2Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleLarge(
          context.str.slide2BoldedText,
          fontWeight: FontWeight.bold,
        ),
        TitleLarge('${context.str.slide2TrailingText}!'),
      ],
    );
  }
}
