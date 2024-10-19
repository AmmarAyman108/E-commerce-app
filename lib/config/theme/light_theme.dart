import 'package:flutter/material.dart';

abstract class LightTheme {
  static ThemeData get() =>
      ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white);
}
