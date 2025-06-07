import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../logic/login_cubit.dart';
import 'dont_have_account.dart';
import 'forget_pass_widget.dart';
import 'login_form.dart';

class LoginFormContainer extends StatelessWidget {
  const LoginFormContainer({super.key});

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
                'Sign in',
                style: AppTextStyles.fontTitleText(color: Colors.black),
              ),
              verticalSpace(32),
              const EmailAndPasswordForm(),
              verticalSpace(8),
              const ForgotPassWidget(),
              verticalSpace(32),
              CustomButton(
                title: 'Sign in',
                onTap: () {
                  FocusScope.of(context).unfocus();
                  if (context
                      .read<LoginCubit>()
                      .loginFormKey
                      .currentState!
                      .validate()) {
                    context.read<LoginCubit>().login();
                  }
                },
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
