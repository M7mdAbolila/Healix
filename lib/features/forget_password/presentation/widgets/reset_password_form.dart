import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  bool isVisible = false;
  bool isConfirmVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        CustomTextFormField(
          title: 'New Password',
          hintText: 'New Password',
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          isObscureText: isVisible,
          suffixIcon: IconButton(
            icon: isVisible
                ? Assets.svgs.passEye.svg()
                : Assets.svgs.passEyeSlash.svg(),
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
          ),
          validator: (v) {
            if (v!.isEmpty) {
              return 'Password is required';
            } else if (!AppRegex.isPasswordValid(v)) {
              return 'Use at least 8 characters with a mix of uppercase, lowercase, numbers, and special symbols; avoid common words, personal info, and repeated patterns. ';
            }
            return null;
          },
        ),
        CustomTextFormField(
          title: 'Confirm Password',
          hintText: 'Confirm Password',
          isObscureText: isConfirmVisible,
          suffixIcon: IconButton(
            icon: isConfirmVisible
                ? Assets.svgs.passEye.svg()
                : Assets.svgs.passEyeSlash.svg(),
            onPressed: () {
              setState(() {
                isConfirmVisible = !isConfirmVisible;
              });
            },
          ),
          validator: (v) {
            if (v!.isEmpty) {
              return 'Password is required';
            } else if (!AppRegex.isPasswordValid(v)) {
              return 'Use at least 8 characters with a mix of uppercase, lowercase, numbers, and special symbols; avoid common words, personal info, and repeated patterns. ';
            }
            return null;
          },
        ),
      ],
    );
  }
}
