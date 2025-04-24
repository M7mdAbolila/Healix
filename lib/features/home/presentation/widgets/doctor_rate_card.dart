import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class DoctorRateCard extends StatelessWidget {
  const DoctorRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        spacing: 8.w,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '4.5',
            style: AppTextStyles.fontSmallerText(
              color: ColorsManager.darkerGreyText,
            ),
          ),
          Assets.svgs.yellowStar.svg(
            height: 12.h,
            width: 12.w,
          ),
        ],
      ),
    );
  }
}
