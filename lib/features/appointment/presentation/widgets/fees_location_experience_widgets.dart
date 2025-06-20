import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class FeesLocationExperienceWidgets extends StatelessWidget {
  const FeesLocationExperienceWidgets({
    super.key,
    this.hasExperience = true,
    this.fees,
    this.location,
    this.experience,
  });
  final bool hasExperience;
  final String? fees;
  final String? location;
  final String? experience;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 8.w,
          children: [
            Assets.svgs.fees.svg(height: 24.h, width: 24.w),
            Text(
              'Fees:',
              style: AppTextStyles.fontBodyText(
                color: ColorsManager.darkGreyText,
              ),
            ),
            Text(
              '${fees ?? 0} EGP',
              style: AppTextStyles.fontTextInput(
                color: ColorsManager.darkGreyText,
              ),
            ),
          ],
        ),
        Row(
          spacing: 8.w,
          children: [
            Assets.svgs.location.svg(height: 24.h, width: 24.w),
            Text(
              'Location:',
              style: AppTextStyles.fontBodyText(
                color: ColorsManager.darkGreyText,
              ),
            ),
            Text(
              location ?? 'Unknown',
              style: AppTextStyles.fontTextInput(
                color: ColorsManager.darkGreyText,
              ),
            ),
          ],
        ),
        if (hasExperience)
          Text(
            'Experience: ${experience ?? 'X'} Years',
            style: AppTextStyles.fontParagraphText(
              color: ColorsManager.primaryColor,
            ),
          ),
      ],
    );
  }
}
