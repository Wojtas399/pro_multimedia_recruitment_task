import 'package:flutter/material.dart';

import 'config/theme.dart';
import 'slide_3/slide_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme().themeData,
      home: const Slides(),
    );
  }
}

class Slides extends StatefulWidget {
  const Slides({super.key});

  @override
  State<Slides> createState() => _SlidesState();
}

class _SlidesState extends State<Slides> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Slide3(),
      ),
    );
  }
}
