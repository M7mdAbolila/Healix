import 'package:flutter/material.dart';

import '../../../../core/gen/assets.gen.dart';
import 'onboarding_content.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController pageController;
  final ValueChanged<int> onPageChanged;
  final bool slideFromRight;
  const OnboardingPageView({
    required this.pageController,
    required this.onPageChanged,
    required this.slideFromRight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      children: [
        OnboardingContent(
          title: ' Your Smart\nAI Health Assistant',
          description:
              'AI-powered assistant designed to help you analyze symptoms, track medical history, and book doctor appointments.',
          imagePath: Assets.svgs.onboarding1.path,
          slideFromRight: slideFromRight,
        ),
        OnboardingContent(
          title: 'Instant Symptom Analysis,\nBacked by AI',
          description:
              'Describe your symptoms, & our AI will analyze them to provide health insights No more guessing about your health.',
          imagePath: Assets.svgs.onboarding2.path,
          slideFromRight: slideFromRight,
        ),
        OnboardingContent(
          title: 'Find the Right Doctor in\nJust a Few Taps',
          description:
              'Easily search and book appointments with verified doctors. Get the medical attention you need without long waiting times.',
          imagePath: Assets.svgs.onboarding3.path,
          slideFromRight: slideFromRight,
        ),
        OnboardingContent(
          title: 'Stay Ahead of Health Risks\nFor You & Your Family',
          description:
              'Monitor your personal medical history and track family health patterns to detect potential chronic diseases early.',
          imagePath: Assets.svgs.onboarding4.path,
          slideFromRight: slideFromRight,
        ),
      ],
    );
  }
}
