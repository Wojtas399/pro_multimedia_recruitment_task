import 'package:flutter/material.dart';

import '../extensions/build_context_extensions.dart';

class SlidesActions extends StatelessWidget {
  final bool isLastSlide;
  final VoidCallback onSkipPressed;
  final VoidCallback onNextPressed;
  final VoidCallback onFinishPressed;

  const SlidesActions({
    super.key,
    required this.isLastSlide,
    required this.onSkipPressed,
    required this.onNextPressed,
    required this.onFinishPressed,
  });

  @override
  Widget build(BuildContext context) {
    return isLastSlide
        ? SizedBox(
            width: 175,
            child: _FilledButton(
              onPressed: onFinishPressed,
              label: '${context.str.buttonStart}!',
            ),
          )
        : _SkipAndNextButtons(
            onSkipPressed: onSkipPressed,
            onNextPressed: onNextPressed,
          );
  }
}

class _SkipAndNextButtons extends StatelessWidget {
  final VoidCallback onSkipPressed;
  final VoidCallback onNextPressed;

  const _SkipAndNextButtons({
    required this.onSkipPressed,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: SizedBox(
              width: 150,
              child: _SkipButton(
                onPressed: onSkipPressed,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: SizedBox(
              width: 150,
              child: _NextButton(
                onPressed: onNextPressed,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SkipButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: const WidgetStatePropertyAll(Color(0xFFB2B2B2)),
        textStyle: WidgetStatePropertyAll(
          context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: onPressed,
      child: Text(context.str.buttonSkip),
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
      label: context.str.buttonNext,
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
          context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
