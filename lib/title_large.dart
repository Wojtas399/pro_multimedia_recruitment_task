import 'package:flutter/material.dart';

class TitleLarge extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;

  const TitleLarge(
    this.data, {
    super.key,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: fontWeight,
          ),
    );
  }
}
