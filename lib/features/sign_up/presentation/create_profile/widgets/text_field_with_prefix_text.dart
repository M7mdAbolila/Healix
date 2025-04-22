import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/text_styles.dart';

class TextFieldWithPrifixText extends StatelessWidget {
  const TextFieldWithPrifixText({
    super.key,
    required this.title,
    required this.hintText,
    required this.prefixText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
  });
  final String title;
  final String hintText;
  final String prefixText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkGreyText,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(61, 158, 158, 158),
                blurRadius: 5.6.r,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Row(
            spacing: 8.w,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: ColorsManager.primaryColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  prefixText,
                  style: AppTextStyles.fontSmallerText(
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  textInputAction: textInputAction,
                  keyboardType: keyboardType,
                  validator: validator,
                  cursorColor: ColorsManager.primaryColor,
                  decoration: InputDecoration(
                    isDense: true,
                    errorMaxLines: 4,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
                    hintStyle: AppTextStyles.fontTextInput(
                      color: ColorsManager.grey500,
                    ),
                    hintText: hintText,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
