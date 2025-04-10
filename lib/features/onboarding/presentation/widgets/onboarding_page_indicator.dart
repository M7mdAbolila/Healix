import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theming/colors.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final PageController pageController;

  const OnboardingPageIndicator({
    required this.pageController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 4,
      effect: ExpandingDotsEffect(
        dotWidth: 8.w,
        dotHeight: 8.h,
        spacing: 10.w,
        dotColor: ColorsManager.grey,
        activeDotColor: ColorsManager.grey,
      ),
    );
  }
}
