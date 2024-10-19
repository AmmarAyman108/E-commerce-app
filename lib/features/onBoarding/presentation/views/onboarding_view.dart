import 'package:ecommerce_app/config/router/routes.dart';
import 'package:ecommerce_app/features/onBoarding/presentation/views/widgets/custom_floating_action_button.dart';
import 'package:ecommerce_app/features/onBoarding/presentation/views/widgets/custom_page_view.dart';
import 'package:ecommerce_app/features/onBoarding/presentation/views/widgets/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 25.h,
            ),
          ),
          const SliverToBoxAdapter(child: SkipButton()),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: CustomPageView(
                controller: controller,
              ),
            ),
          ),
        ]),
        floatingActionButton: CustomFloatingActionButton(
          controller: controller,
          maxPageNumber: 2,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

void navigateToNextPage(PageController controller) {
  controller.nextPage(
    duration: const Duration(seconds: 2),
    curve: Easing.legacy,
  );
}

void navigateToLogin(BuildContext context) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    Routes.login,
    (route) => false,
  );
}
