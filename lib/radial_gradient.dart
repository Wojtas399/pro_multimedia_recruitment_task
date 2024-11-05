import 'package:flutter/material.dart';

class CustomRadialGradient extends StatelessWidget {
  const CustomRadialGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.36,
          colors: [
            const Color(0xFFC3E3FF),
            Theme.of(context).scaffoldBackgroundColor
          ],
        ),
      ),
    );
  }
}
