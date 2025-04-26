import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/theming/text_styles.dart';

import '../../../../core/theming/colors_manager.dart';

class PreviousDiscussionsCard extends StatelessWidget {
  const PreviousDiscussionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ColorsManager.lightGreyText,
        ),
      ),
      child: Row(
        spacing: 8.w,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'I have a cough and a runny nose.',
                  style: AppTextStyles.fontBodyText(
                    color: ColorsManager.darkerGreyText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Apr 9, 2025 | 1:50 PM',
                  style: AppTextStyles.fontParagraphText(
                    color: ColorsManager.darkGreyText,
                  ),
                ),
              ],
            ),
          ),
          Assets.svgs.rightArrow.svg(
            height: 24.h,
            width: 24.w,
          ),
        ],
      ),
    );
  }
}
