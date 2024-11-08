import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtensions on BuildContext {
  Orientation get deviceOrientation => MediaQuery.of(this).orientation;

  TextTheme get textTheme => Theme.of(this).textTheme;

  Str get str => Str.of(this);
}
