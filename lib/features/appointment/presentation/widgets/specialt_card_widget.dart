import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healix/core/helpers/extensions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class SpecialtCardWidget extends StatelessWidget {
  const SpecialtCardWidget({
    super.key,
    required this.title,
    required this.iconPath,
  });
  final String title;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.doctorsListScreen),
      child: Container(
        padding: EdgeInsets.all(16.r),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: ColorsManager.lightGreyText),
        ),
        child: Row(
          spacing: 16.w,
          children: [
            SvgPicture.asset(iconPath, height: 24.h, width: 24.w),
            Text(
              title,
              style: AppTextStyles.fontTextInput(
                color: ColorsManager.grey800,
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: ColorsManager.blue20,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                color: ColorsManager.primaryColor,
                size: 24.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
