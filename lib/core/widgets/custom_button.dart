import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/text_styles.dart';

import '../theming/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.backgroundColor = ColorsManager.primaryColor,
    this.textStyle,
    this.width,
    this.height,
    this.enable = true,
  });
  final String title;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enable ? onTap : null,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: enable ? backgroundColor : ColorsManager.darkGreyText,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            title,
            style:
                textStyle ?? AppTextStyles.fontTextInput(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
