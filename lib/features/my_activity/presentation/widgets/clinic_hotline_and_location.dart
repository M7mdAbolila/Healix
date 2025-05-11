import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class ClinicHotlineAndLocation extends StatelessWidget {
  const ClinicHotlineAndLocation({super.key});

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
              '19019',
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
              'Cairo Business Plaza',
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
