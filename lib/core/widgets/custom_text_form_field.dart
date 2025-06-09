import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/text_styles.dart';

import '../theming/colors_manager.dart';
import '../theming/shadows_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final String? title;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String?)? onChanged;
  final Function(String?)? onFieldSubmit;

  final int? maxLines;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.title,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.isObscureText,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onFieldSubmit,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: title != null ? 4.h : 0,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Text(
            title!,
            style: AppTextStyles.fontTextInput(
              color: ColorsManager.darkGreyText,
            ),
          ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              ShadowsManager.softerShadow(),
            ],
          ),
          child: TextFormField(
            controller: controller,
            textInputAction: textInputAction,
            keyboardType: keyboardType ?? TextInputType.name,
            obscureText: isObscureText ?? false,
            maxLines: maxLines ?? 1,
            validator: validator,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmit,
            cursorColor: ColorsManager.primaryColor,
            style: inputTextStyle,
            decoration: InputDecoration(
              isDense: true,
              errorMaxLines: 4,
              filled: true,
              fillColor: Colors.white,
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              hintStyle: hintStyle ??
                  AppTextStyles.fontTextInput(
                    color: ColorsManager.lightGreyText,
                  ),
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8.r),
              ),
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ColorsManager.supportColor),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorsManager.alertColor),
                borderRadius: BorderRadius.circular(8.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorsManager.alertColor),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
