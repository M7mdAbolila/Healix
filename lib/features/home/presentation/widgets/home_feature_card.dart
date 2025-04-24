import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healix/core/helpers/spacing.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class HomeFeatureCard extends StatelessWidget {
  const HomeFeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.iconPath,
  });
  final String title;
  final String description;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ColorsManager.lightGreyText,
        ),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            iconPath,
            height: 56.h,
            width: 56.w,
          ),
          verticalSpace(16),
          Text(
            title,
            style: AppTextStyles.fontTextInput(
              color: ColorsManager.darkerGreyText,
            ),
          ),
          verticalSpace(4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyles.fontSmallerText(
              color: ColorsManager.darkGreyText,
            ),
          ),
        ],
      ),
    );
  }
}
