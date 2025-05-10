import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class FeesLocationExperienceWidgets extends StatelessWidget {
  const FeesLocationExperienceWidgets({super.key, this.hasExperience = true});
  final bool hasExperience;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 8.w,
          children: [
            Assets.svgs.fees.svg(),
            Text(
              'Fees:',
              style: AppTextStyles.fontBodyText(
                color: ColorsManager.darkGreyText,
              ),
            ),
            Text(
              '500 EGP',
              style: AppTextStyles.fontTextInput(
                color: ColorsManager.darkGreyText,
              ),
            ),
          ],
        ),
        Row(
          spacing: 8.w,
          children: [
            Assets.svgs.location.svg(),
            Text(
              'Location:',
              style: AppTextStyles.fontBodyText(
                color: ColorsManager.darkGreyText,
              ),
            ),
            Text(
              'Cairo, Egypt',
              style: AppTextStyles.fontTextInput(
                color: ColorsManager.darkGreyText,
              ),
            ),
          ],
        ),
        if (hasExperience)
          Text(
            'Experience: X Years',
            style: AppTextStyles.fontParagraphText(
              color: ColorsManager.primaryColor,
            ),
          ),
      ],
    );
  }
}
