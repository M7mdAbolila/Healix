import 'package:flutter/material.dart';

import '../../../../core/widgets/grey_back_button.dart';
import 'skip_button.dart';

class OnboardingHeader extends StatelessWidget {
  final int currentPage;
  final VoidCallback onTapBack;
  final VoidCallback onTapSkip;

  const OnboardingHeader({
    required this.currentPage,
    required this.onTapBack,
    required this.onTapSkip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        currentPage != 0
            ? GreyBackButton(
                onTap: onTapBack,
              )
            : const SizedBox.shrink(),
        currentPage != 3
            ? SkipButton(
                onTap: onTapSkip,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
