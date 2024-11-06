import 'package:flutter/widgets.dart';

extension BuildContextExtensions on BuildContext {
  Orientation get deviceOrientation => MediaQuery.of(this).orientation;
}
