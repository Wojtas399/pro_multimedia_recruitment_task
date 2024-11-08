import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'config/theme.dart';
import 'extensions/build_context_extensions.dart';
import 'slides/slide_1/slide_1.dart';
import 'slides/slide_2/slide_2.dart';
import 'slides/slide_3/slide_3.dart';
import 'slides/slide_4/slide_4.dart';
import 'slides/slide_5/slide_5.dart';
import 'slides/slide_6/slide_6.dart';
import 'slides/slides_actions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProMultimedia recruitment task',
      theme: CustomTheme().themeData,
      localizationsDelegates: Str.localizationsDelegates,
      supportedLocales: Str.supportedLocales,
      home: const _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: _Slides(),
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides();

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final List<Widget> _slides = const [
    Slide1(),
    Slide2(),
    Slide3(),
    Slide4(),
    Slide5(),
    Slide6(),
  ];
  int _currentSlideIndex = 0;

  void _nextSlide() {
    setState(() {
      _currentSlideIndex = _currentSlideIndex + 1;
    });
  }

  Future<void> _finish() async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(context.str.finishDialogTitle),
        content: Text(context.str.finishDialogMessage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: _slides[_currentSlideIndex],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          child: SlidesActions(
            isLastSlide: _currentSlideIndex == _slides.length - 1,
            onNextPressed: _nextSlide,
            onFinishPressed: _finish,
          ),
        ),
      ],
    );
  }
}
