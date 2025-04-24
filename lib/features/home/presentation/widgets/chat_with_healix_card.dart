import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/theming/colors.dart';
import 'package:healix/core/theming/text_styles.dart';

class ChatWithHealixCard extends StatelessWidget {
  const ChatWithHealixCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 109, 154, 202),
            Color.fromARGB(255, 109, 154, 202),
            ColorsManager.primaryColor,
            Color.fromARGB(255, 126, 167, 211),
            ColorsManager.primaryColor,
            ColorsManager.primaryColor,
            ColorsManager.primaryColor,
            Color.fromARGB(255, 109, 154, 202),
          ],
        ),
      ),
      child: Column(
        spacing: 24.h,
        children: [
          _buildTitleTextAndLogoRow(),
          _buildSubTitleTextAndTryNowButtonRow(),
        ],
      ),
    );
  }

  Row _buildSubTitleTextAndTryNowButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Describe your symptoms & let Healix do the rest!',
            style: AppTextStyles.fontParagraphText(
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16.w),
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            'Try Now!',
            style: AppTextStyles.fontParagraphText(
              color: ColorsManager.grey800,
            ),
          ),
        ),
      ],
    );
  }

  Row _buildTitleTextAndLogoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Chat With Dr.Healix!',
            style: AppTextStyles.fontTitleText(
              color: Colors.white,
            ),
          ),
        ),
        Assets.svgs.mainLogo.svg(
          width: 80.w,
        ),
      ],
    );
  }
}
