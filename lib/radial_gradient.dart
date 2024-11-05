import 'package:flutter/material.dart';

class CustomRadialGradient extends StatelessWidget {
  const CustomRadialGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
