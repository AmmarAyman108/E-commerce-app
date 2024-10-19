import 'package:ecommerce_app/features/onBoarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.controller,
    required this.maxPageNumber,
  });

  final PageController controller;
  final int maxPageNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: ExpandingDotsEffect(
                dotHeight: 15.h,
                dotWidth: 12.w,
                activeDotColor: const Color.fromARGB(255, 0, 74, 135)),
          ),
          FloatingActionButton(
            onPressed: () {
              if (controller.page == maxPageNumber) {
                navigateToLogin(context);
              }
              navigateToNextPage(controller);
            },
            shape: const CircleBorder(),
            backgroundColor: const Color.fromARGB(255, 0, 74, 135),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
