import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopHeadLine extends StatelessWidget {
  final String headLine;
  const TopHeadLine({
    super.key,
    required this.headLine,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      headLine,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
