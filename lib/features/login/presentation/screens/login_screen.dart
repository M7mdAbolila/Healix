import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/theming/colors.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/features/login/presentation/widgets/dont_have_account.dart';
import 'package:healix/features/login/presentation/widgets/forget_pass_widget.dart';
import 'package:healix/features/login/presentation/widgets/login_form.dart';

import '../../../../core/helpers/spacing.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: ColorsManager.authBackground,
        body: Stack(
          children: [
            _buildBackgroundImage(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Assets.images.authPicture.image(
      width: double.infinity,
      height: 360.h,
      fit: BoxFit.cover,
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.only(top: 90.h),
      child: Column(
        children: [
          Assets.svgs.whiteLogoWithWord.svg(
            width: 162.w,
            height: 93.h,
          ),
          verticalSpace(8),
          Text(
            'Smarter Health, Safer Future!',
            style: AppTextStyles.fontBodyText(color: Colors.white),
          ),
          verticalSpace(32),
          Expanded(
            child: _buildFormContainer(),
          ),
        ],
      ),
    );
  }

  Widget _buildFormContainer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.dimmedBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(32),
              Text(
                'Sign in',
                style: AppTextStyles.fontTitleText(color: Colors.black),
              ),
              verticalSpace(32),
              const EmailAndPasswordForm(),
              verticalSpace(16),
              const ForgotPassWidget(),
              verticalSpace(32),
              CustomButton(
                title: 'Sign in',
                onTap: () {},
              ),
              verticalSpace(145),
              const DontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
