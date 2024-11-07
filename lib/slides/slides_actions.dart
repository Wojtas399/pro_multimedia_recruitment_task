import 'package:flutter/material.dart';

class SlidesActions extends StatelessWidget {
  final bool isLastSlide;
  final VoidCallback onNextPressed;
  final VoidCallback onFinishPressed;

  const SlidesActions({
    super.key,
    required this.isLastSlide,
    required this.onNextPressed,
    required this.onFinishPressed,
  });

  @override
  Widget build(BuildContext context) {
    return isLastSlide
        ? _FilledButton(
            onPressed: onFinishPressed,
            label: 'Zaczynamy',
          )
        : Row(
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
    return _FilledButton(
      onPressed: onPressed,
      label: 'Dalej',
    );
  }
}

class _FilledButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _FilledButton({
    required this.label,
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
      child: Text(label),
    );
  }
}
