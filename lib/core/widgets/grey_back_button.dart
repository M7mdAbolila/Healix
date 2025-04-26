import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/theming/colors_manager.dart';

class GreyBackButton extends StatelessWidget {
  const GreyBackButton({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => context.pop(),
      child: Container(
        width: 30.w,
        height: 30.h,
        decoration: BoxDecoration(
          color: ColorsManager.lightGreyText,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: ColorsManager.grey500,
            size: 16.sp,
          ),
        ),
      ),
    );
  }
}
