import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class ClinicHotlineAndLocation extends StatelessWidget {
  const ClinicHotlineAndLocation({super.key, this.hotline, this.location});
  final String? hotline;
  final String? location;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 8.w,
          children: [
            Assets.svgs.call.svg(height: 24.h, width: 24.w),
            Text(
              'Hotline: ',
              style: AppTextStyles.fontBodyText(
                color: ColorsManager.darkGreyText,
              ),
            ),
            Text(
              hotline ?? 'Not Available',
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
              location ?? 'Not Available',
              style: AppTextStyles.fontTextInput(
                color: ColorsManager.darkGreyText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
