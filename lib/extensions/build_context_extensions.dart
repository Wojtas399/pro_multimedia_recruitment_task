import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtensions on BuildContext {
  Orientation get deviceOrientation => MediaQuery.of(this).orientation;

  Str get str => Str.of(this);
}
