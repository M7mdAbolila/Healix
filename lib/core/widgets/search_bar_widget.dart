import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/assets.gen.dart';
import '../theming/colors_manager.dart';
import '../theming/shadows_manager.dart';
import '../theming/text_styles.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    this.hasFilter = false,
    this.padding,
  });
  final bool hasFilter;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        spacing: 16.w,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: ColorsManager.grey200),
                boxShadow: [
                  ShadowsManager.softerShadow(),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search',
                    style: AppTextStyles.fontTextInput(
                      color: ColorsManager.grey500,
                    ),
                  ),
                  Assets.svgs.searchIcon.svg(
                    height: 24.h,
                    width: 24.w,
                  ),
                ],
              ),
            ),
          ),
          if (hasFilter)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: ColorsManager.grey200),
                boxShadow: [
                  ShadowsManager.softerShadow(),
                ],
              ),
              child: Assets.svgs.filterSquare.svg(
                height: 24.h,
                width: 24.w,
              ),
            ),
        ],
      ),
    );
  }
}
