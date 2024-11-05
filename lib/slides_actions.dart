import 'package:flutter/material.dart';

class SlidesActions extends StatelessWidget {
  final VoidCallback onNextPressed;

  const SlidesActions({
    super.key,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Center(
            child: _SkipButton(),
          ),
        ),
        Expanded(
          child: Center(
            child: _NextButton(
              onPressed: onNextPressed,
            ),
          ),
        ),
      ],
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: const WidgetStatePropertyAll(Color(0xFFB2B2B2)),
        textStyle: WidgetStatePropertyAll(
          Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {},
      child: const Text('Pomiń'),
    );
  }
}

class _NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _NextButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(
          Color(0xFF0568B0),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        textStyle: WidgetStatePropertyAll(
          Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: onPressed,
      child: const Text('Dalej'),
    );
  }
}
