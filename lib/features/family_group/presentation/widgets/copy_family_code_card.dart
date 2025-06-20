import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';

class CopyFamilyCodeCard extends StatelessWidget {
  const CopyFamilyCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: ColorsManager.blue10,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ColorsManager.blue40,
        ),
      ),
      child: Row(
        spacing: 16.w,
        children: [
          Assets.svgs.people.svg(
            width: 24.w,
            height: 24.h,
          ),
          Text(
            'Copy Family Code',
            style: AppTextStyles.fontTextInput(color: ColorsManager.blue80),
          ),
          const Spacer(),
          Assets.svgs.copyFamilyCode.svg(
            width: 24.w,
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
