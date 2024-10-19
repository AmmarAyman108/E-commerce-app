import 'package:ecommerce_app/features/onBoarding/data/models/onboarding_model.dart';
import 'package:ecommerce_app/features/onBoarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageView extends StatefulWidget {
  final PageController controller;

  const CustomPageView({super.key, required this.controller});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  List<OnboardingModel> onboardingItemsModel = [
    OnboardingModel(
        description: 'description',
        image: 'assets/images/onBoarding1_image.jpeg',
        title: 'title'),
    OnboardingModel(
        description: 'description',
        image: 'assets/images/onBoarding3_image.jpeg',
        title: 'title'),
    OnboardingModel(
        description: 'description',
        image: 'assets/images/onBoarding1_image.jpeg',
        title: 'title'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: PageView.builder(
        controller: widget.controller,
        itemCount: onboardingItemsModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => PageViewItem(
          itemData: onboardingItemsModel[index],
        ),
      ),
    );
  }
}
