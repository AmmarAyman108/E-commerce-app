import 'package:ecommerce_app/features/onBoarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(right: 20.r),
            child: Text(
              'Skip',
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 0, 74, 135)),
            ),
          ),
          onTap: () {
            navigateToLogin(context);
          },
        ),
      ],
    );
  }
}
