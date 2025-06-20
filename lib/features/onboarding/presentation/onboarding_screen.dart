import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/custom_button.dart';
import 'widgets/all_in_one_widget.dart';
import 'widgets/onboarding_header.dart';
import 'widgets/onboarding_page_indicator.dart';
import 'widgets/onboarding_page_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool _slideFromRight = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              verticalSpace(24),
              OnboardingHeader(
                currentPage: _currentPage,
                onTapBack: () => _pageController.jumpToPage(_currentPage - 1),
                onTapSkip: () => _pageController.jumpToPage(3),
              ),
              verticalSpace(24),
              Assets.svgs.logoWithWord.svg(
                width: 162.w,
                height: 93.h,
              ),
              verticalSpace(16),
              Expanded(
                child: OnboardingPageView(
                  pageController: _pageController,
                  slideFromRight: _slideFromRight,
                  onPageChanged: (index) {
                    setState(() {
                      _slideFromRight = index > _currentPage;
                      _currentPage = index;
                    });
                  },
                ),
              ),
              if (_currentPage == 0) const AllInOneWidget(),
              OnboardingPageIndicator(
                pageController: _pageController,
              ),
              verticalSpace(16),
              CustomButton(
                title: _currentPage == 3 ? 'Let\'s Start!' : 'Next',
                onTap: () {
                  if (_currentPage < 3) {
                    _pageController.jumpToPage(_currentPage + 1);
                  } else {
                    context.pushNamed(Routes.signUpScreen);
                  }
                },
              ),
              verticalSpace(24),
            ],
          ),
        ),
      ),
    );
  }
}
