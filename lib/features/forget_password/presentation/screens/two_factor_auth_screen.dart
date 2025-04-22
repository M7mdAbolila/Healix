import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/routing/routes.dart';
import 'package:healix/core/theming/colors.dart';
import 'package:healix/core/widgets/custom_back_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class TwoFactorAuthScreen extends StatelessWidget {
  const TwoFactorAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(50),
                _buildVerifyHeader(),
                verticalSpace(135),
                _buildVerfiyInstructions(),
                verticalSpace(16),
                PinCodeTextField(
                  appContext: context,
                  autoFocus: true,
                  cursorColor: ColorsManager.darkerGreyText,
                  keyboardType: TextInputType.number,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10.r),
                    fieldHeight: 60.h,
                    fieldWidth: 45.w,
                    borderWidth: 1,
                    activeColor: ColorsManager.primaryColor,
                    inactiveColor: Colors.transparent,
                    inactiveFillColor: ColorsManager.grey400,
                    activeFillColor: ColorsManager.grey400,
                    selectedColor: ColorsManager.primaryColor,
                    selectedFillColor: ColorsManager.grey500,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (submitedCode) {},
                ),
                verticalSpace(16),
                _buildResendCodeWidget(),
                verticalSpace(26),
                CustomButton(
                  title: 'Verify Email',
                  onTap: () => context.pushNamed(Routes.createProfileScreen),
                ),
                verticalSpace(100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildResendCodeWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Didn’t receive the code?',
          textAlign: TextAlign.center,
          style: AppTextStyles.fontParagraphText(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        horizontalSpace(8),
        Text(
          'Resend',
          textAlign: TextAlign.center,
          style: AppTextStyles.fontParagraphText(
            color: ColorsManager.informingColor,
          ).copyWith(
            decoration: TextDecoration.underline,
            decorationColor: ColorsManager.informingColor,
          ),
        ),
      ],
    );
  }

  Column _buildVerfiyInstructions() {
    return Column(
      children: [
        Text(
          'We’ve sent a 6-digit code to your email example@email.com',
          textAlign: TextAlign.center,
          style: AppTextStyles.fontParagraphText(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        verticalSpace(16),
        Text(
          'Enter the code below to verify your email and continue.',
          textAlign: TextAlign.center,
          style: AppTextStyles.fontParagraphText(
            color: ColorsManager.darkerGreyText,
          ),
        ),
      ],
    );
  }

  Column _buildVerifyHeader() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: CustomBackButton(),
        ),
        verticalSpace(50),
        Text(
          '2-Step Verification',
          style: AppTextStyles.fontTitleText(
            color: ColorsManager.darkerGreyText,
          ),
        ),
      ],
    );
  }
}
