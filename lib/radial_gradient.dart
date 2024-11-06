import 'package:flutter/material.dart';

class CustomRadialGradient extends StatelessWidget {
  final double radius;

  const CustomRadialGradient({
    super.key,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: radius,
          colors: [
            const Color(0xFFC3E3FF),
            Theme.of(context).scaffoldBackgroundColor
            // Colors.red,
          ],
        ),
      ),
    );
  }
}
