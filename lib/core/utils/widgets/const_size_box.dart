import 'package:flutter/material.dart';

class ConstSizeBox extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  const ConstSizeBox({
    super.key,
    this.height,
    this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
}
