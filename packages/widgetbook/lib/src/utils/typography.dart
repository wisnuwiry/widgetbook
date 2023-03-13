import 'package:flutter/material.dart';

class Typography {
  static const TextStyle subtitle2 = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static TextTheme textTheme = const TextTheme(
    titleMedium: subtitle1,
    titleSmall: subtitle2,
  );
}
