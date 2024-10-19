import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFavoritesAppBar extends StatelessWidget {
  const MyFavoritesAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "My Favorites",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
    );
  }
}
