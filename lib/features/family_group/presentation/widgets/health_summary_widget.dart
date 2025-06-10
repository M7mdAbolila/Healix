import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/text_styles.dart';

import '../../../../core/theming/colors_manager.dart';

class HealthSummaryWidget extends StatelessWidget {
  const HealthSummaryWidget({super.key, this.summaryText});
  final String? summaryText;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Health Summary',
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        Text(
          summaryText ??
              'Health summary is generated automatically by AI after creating a group”',
          style: AppTextStyles.fontBodyText(
            color: summaryText != null
                ? ColorsManager.darkerGreyText
                : ColorsManager.darkGreyText,
          ),
        ),
      ],
    );
  }
}
