import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/widgets/custom_text_form_field.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/custom_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomBackButton(),
              ),
              const Spacer(),
              Text(
                'Forgot yo﻿ur password?',
                style: AppTextStyles.fontTitleText(
                  color: ColorsManager.darkerGreyText,
                ),
              ),
              verticalSpace(16),
              _buildForgotPassInstructions(),
              verticalSpace(32),
              _buildEmailTextFeild(),
              verticalSpace(32),
              CustomButton(
                title: 'Send OTP',
                onTap: () {},
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildForgotPassInstructions() {
    return Column(
      children: [
        Text(
          'Enter your registered email, and we’ll send you a 6-digit code to reset your password.',
          textAlign: TextAlign.center,
          style: AppTextStyles.fontParagraphText(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        verticalSpace(16),
        Text(
          'Make sure to check your inbox (or spam folder) for the OTP.',
          textAlign: TextAlign.center,
          style: AppTextStyles.fontParagraphText(
            color: ColorsManager.darkerGreyText,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTextFeild() {
    return CustomTextFormField(
      title: 'Email',
      hintText: 'ie. example@email',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      validator: (v) {
        if (v!.isEmpty) {
          return 'Email is required';
        } else if (!AppRegex.isEmailValid(v)) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }
}
