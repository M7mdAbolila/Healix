import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/colors.dart';
import 'package:healix/core/theming/text_styles.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'Skip',
        style: AppTextStyles.fontBodyText(
          color: ColorsManager.grey400,
        ).copyWith(height: 1.7.h),
      ),
    );
  }
}
