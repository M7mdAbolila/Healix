import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/text_styles.dart';

import '../theming/colors.dart';

class CustomTextFormField extends StatefulWidget {
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
  final Function(String?)? onSumitted;

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
    this.onSumitted,
    this.maxLines,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();
  Color _spaceColor = ColorsManager.grey200;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _spaceColor =
            _focusNode.hasFocus ? ColorsManager.grey700 : ColorsManager.grey200;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: widget.title != null ? 4.h : 0,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: AppTextStyles.fontTextInput(
              color: ColorsManager.darkGreyText,
            ),
          ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(61, 158, 158, 158),
                blurRadius: 5.6.r,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Column(
              children: [
                TextFormField(
                  focusNode: _focusNode,
                  controller: widget.controller,
                  textInputAction: widget.textInputAction,
                  keyboardType: widget.keyboardType ?? TextInputType.name,
                  obscureText: widget.isObscureText ?? false,
                  maxLines: widget.maxLines ?? 1,
                  validator: widget.validator,
                  onChanged: widget.onChanged,
                  onFieldSubmitted: widget.onSumitted,
                  cursorColor: ColorsManager.primaryColor,
                  style: widget.inputTextStyle,
                  decoration: InputDecoration(
                    isDense: true,
                    errorMaxLines: 4,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: widget.contentPadding ??
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
                    hintStyle: widget.hintStyle ??
                        AppTextStyles.fontParagraphText(
                          color: ColorsManager.lightGreyText,
                        ),
                    hintText: widget.hintText,
                    prefixIcon: widget.prefixIcon,
                    suffixIcon: widget.suffixIcon,
                    border: InputBorder.none,
                  ),
                ),
                Container(
                  height: 8.h,
                  color: _spaceColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
