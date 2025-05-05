import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class RecentRecordCard extends StatelessWidget {
  const RecentRecordCard({
    super.key,
    required this.record,
  });
  final RecentRecordModel record;
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
        spacing: 16.w,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.title,
                  style: AppTextStyles.fontBodyText(
                    color: ColorsManager.darkerGreyText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  record.description,
                  style: AppTextStyles.fontParagraphText(
                    color: ColorsManager.darkGreyText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  record.date,
                  style: AppTextStyles.fontSmallerText(
                    color: ColorsManager.darkGreyText,
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            record.iconPath,
            height: 56.h,
            width: 56.w,
          ),
        ],
      ),
    );
  }
}

class RecentRecordModel {
  final String title;
  final String description;
  final String date;
  final String iconPath;

  RecentRecordModel(
    this.title,
    this.description,
    this.date,
    this.iconPath,
  );
}
