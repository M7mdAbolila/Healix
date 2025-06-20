import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/text_styles.dart';
import 'already_have_account.dart';
import 'signup_button_and_terms_widget.dart';
import 'signup_form.dart';

class SignUpFromContainer extends StatelessWidget {
  const SignUpFromContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                'Sign up',
                style: AppTextStyles.fontTitleText(color: Colors.black),
              ),
              verticalSpace(32),
              const SignUpForm(),
              verticalSpace(32),
              const SignUpButtonAndTermsWidget(),
              verticalSpace(65),
              const AlreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
