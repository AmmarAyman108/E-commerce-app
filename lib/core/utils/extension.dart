import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;

  ScaffoldFeatureController showSnackBar({required Widget content}) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: content));
}
