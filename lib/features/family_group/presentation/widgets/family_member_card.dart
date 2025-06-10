import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';

import '../../data/models/family_member_model.dart';

class FamilyMemberCard extends StatelessWidget {
  const FamilyMemberCard({super.key, this.member});
  final FamilyMemberModel? member;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: ColorsManager.lightGreyText,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 8.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                member?.fname ?? '',
                style: AppTextStyles.fontBodyText(
                  color: ColorsManager.darkerGreyText,
                ),
              ),
              Text(
                member?.phoneNumber ?? '',
                style: AppTextStyles.fontParagraphText(
                  color: ColorsManager.darkGreyText,
                ),
              ),
              Text(
                'Blood Type +A',
                style: AppTextStyles.fontParagraphText(
                  color: ColorsManager.darkGreyText,
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Assets.images.doctor.image(
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
