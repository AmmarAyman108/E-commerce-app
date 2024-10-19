import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesAppBar extends StatelessWidget {
  const CategoriesAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Categories",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
    );
  }
}
