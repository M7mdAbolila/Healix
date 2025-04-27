import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({super.key});

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
                  'Corona Virus',
                  style: AppTextStyles.fontBodyText(
                    color: ColorsManager.darkerGreyText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Auctor bibendum vestibulum congue nam lorem.',
                  style: AppTextStyles.fontParagraphText(
                    color: ColorsManager.darkGreyText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Assets.images.virusPic.image(
              height: 56.h,
              width: 56.w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
