import 'package:ecommerce_app/features/onBoarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewItem extends StatelessWidget {
  final OnboardingModel itemData;
  const PageViewItem({super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(itemData.image),
        Text(
          itemData.title,
          style: TextStyle(fontSize: 30.sp),
        ),
        Text(
          itemData.description,
          style: TextStyle(fontSize: 14.sp),
        )
      ],
    );
  }
}
