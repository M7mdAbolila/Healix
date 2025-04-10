import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/theming/colors.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/widgets/custom_back_button.dart';
import 'widgets/skip_button.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentPage != 0
                      ? CustomBackButton(
                          onTap: () =>
                              _pageController.jumpToPage(_currentPage - 1),
                        )
                      : const SizedBox.shrink(),
                  _currentPage == 3
                      ? const SizedBox.shrink()
                      : SkipButton(
                          onTap: () => _pageController.jumpToPage(3),
                        ),
                ],
              ),
              verticalSpace(24),
              Assets.svgs.logoWithWord.svg(
                width: 162.w,
                height: 93.h,
              ),
              verticalSpace(16),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _slideFromRight = index > _currentPage;
                      _currentPage = index;
                    });
                  },
                  children: [
                    OnboardingContent(
                      title: ' Your Smart\nAI Health Assistant',
                      description:
                          'AI-powered assistant designed to help you analyze symptoms, track medical history, and book doctor appointments.',
                      imagePath: Assets.svgs.onboarding1.path,
                      slideFromRight: _slideFromRight,
                    ),
                    OnboardingContent(
                      title: 'Instant Symptom Analysis,\nBacked by AI',
                      description:
                          'Describe your symptoms, & our AI will analyze them to provide health insights No more guessing about your health.',
                      imagePath: Assets.svgs.onboarding2.path,
                      slideFromRight: _slideFromRight,
                    ),
                    OnboardingContent(
                      title: 'Find the Right Doctor in\nJust a Few Taps',
                      description:
                          'Easily search and book appointments with verified doctors. Get the medical attention you need without long waiting times.',
                      imagePath: Assets.svgs.onboarding3.path,
                      slideFromRight: _slideFromRight,
                    ),
                    OnboardingContent(
                      title:
                          'Stay Ahead of Health Risks\nFor You & Your Family',
                      description:
                          'Monitor your personal medical history and track family health patterns to detect potential chronic diseases early.',
                      imagePath: Assets.svgs.onboarding4.path,
                      slideFromRight: _slideFromRight,
                    ),
                  ],
                ),
              ),
              _currentPage == 0
                  ? Column(
                      children: [
                        Assets.svgs.allInOne.svg(),
                        verticalSpace(30),
                      ],
                    )
                  : const SizedBox.shrink(),
              SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: ExpandingDotsEffect(
                  dotWidth: 8.w,
                  dotHeight: 8.h,
                  spacing: 10.w,
                  dotColor: ColorsManager.grey,
                  activeDotColor: ColorsManager.grey,
                ),
              ),
              verticalSpace(16),
              CustomButton(
                title: _currentPage == 3 ? 'Let\'s Start!' : 'Next',
                onTap: () {
                  if (_currentPage < 3) {
                    _pageController.jumpToPage(
                      _currentPage + 1,
                    );
                  } else {}
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
