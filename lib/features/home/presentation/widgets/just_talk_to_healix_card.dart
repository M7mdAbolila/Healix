import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/theming/colors.dart';
import 'package:healix/core/theming/text_styles.dart';

class JustTalkToHealixCard extends StatelessWidget {
  const JustTalkToHealixCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitleAndDescriptionCoulmn(),
          _buildMessageImageAndTryButtonCoulmn(),
        ],
      ),
    );
  }

  Column _buildMessageImageAndTryButtonCoulmn() {
    return Column(
      spacing: 8.h,
      children: [
        Assets.svgs.messageNotif.svg(
          height: 64.h,
          width: 64.w,
        ),
        Container(
          margin: EdgeInsets.only(left: 16.w),
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: ColorsManager.primaryColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            'Try Now!',
            style: AppTextStyles.fontParagraphText(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Column _buildTitleAndDescriptionCoulmn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Not feeling well? 🤒',
          style: AppTextStyles.fontSmallerText(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        Text(
          'Just talk to Healix!',
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        verticalSpace(8),
        Text(
          'Healix can guide you and\nrecommend the perfect\ndoctors for you.s',
          style: AppTextStyles.fontSmallerText(
            color: ColorsManager.darkerGreyText,
          ),
        ),
      ],
    );
  }
}
