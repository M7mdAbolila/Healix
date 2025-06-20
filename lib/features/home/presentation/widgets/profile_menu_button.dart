import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healix/core/theming/colors_manager.dart';

import '../../../../core/theming/text_styles.dart';

class ProfileMenuButton extends StatelessWidget {
  const ProfileMenuButton({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
  });
  final String title;
  final String iconPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
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
          Text(title,
              style: AppTextStyles.fontTextInput(
                color: ColorsManager.blue80,
              )),
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
    );
  }
}
