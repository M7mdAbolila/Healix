import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors_manager.dart';
import '../theming/text_styles.dart';
import 'white_back_button.dart';

class CustomScreenAppBar extends StatelessWidget {
  const CustomScreenAppBar({
    super.key,
    required this.title,
    this.onBackTap,
  });
  final String title;
  final VoidCallback? onBackTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 60.h, 16.w, 24.h),
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8.r),
        ),
      ),
      child: Row(
        spacing: 16.w,
        children: [
          WhiteBackButton(
            onTap: onBackTap,
          ),
          Text(
            title,
            style: AppTextStyles.fontTitleText(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
