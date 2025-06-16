import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../state_management/login_cubit.dart';
import '../state_management/login_state.dart';
import 'login_form.dart';

class LoginFormContainer extends StatelessWidget {
  const LoginFormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: _buildContainerDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(32),
              _buildTitle(),
              verticalSpace(32),
              const LoginForm(),
              verticalSpace(8),
              _buildForgotPasswordButton(context),
              verticalSpace(32),
              _buildLoginButton(context),
              verticalSpace(80),
              _buildSignUpLink(context),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: ColorsManager.dimmedBackground,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.r),
        topRight: Radius.circular(24.r),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Sign in',
      style: AppTextStyles.fontTitleText(color: Colors.black),
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => _navigateToForgotPassword(context),
        borderRadius: BorderRadius.circular(4.r),
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Text(
            'Forgot Password?',
            style: AppTextStyles.fontParagraphText(
              color: ColorsManager.darkerGreyText,
            ).copyWith(
              decoration: TextDecoration.underline,
              decorationColor: ColorsManager.darkerGreyText,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final isLoading = state is LoginLoading;

        return CustomButton(
          title: isLoading ? 'Signing in...' : 'Sign in',
          onTap: () => _handleLogin(context),
          enable: !isLoading,
        );
      },
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: AppTextStyles.fontParagraphText(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        InkWell(
          onTap: () => _navigateToSignUp(context),
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Text(
              'Sign up',
              style: AppTextStyles.fontParagraphText(
                color: ColorsManager.informingColor,
              ).copyWith(
                decoration: TextDecoration.underline,
                decorationColor: ColorsManager.informingColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _handleLogin(BuildContext context) {
    FocusScope.of(context).unfocus();
    final cubit = context.read<LoginCubit>();

    if (cubit.formManager.validateForm()) {
      cubit.login();
    }
  }

  void _navigateToForgotPassword(BuildContext context) {
    context.pushNamed(Routes.forgetPasswordScreen);
  }

  void _navigateToSignUp(BuildContext context) {
    Navigator.of(context).pop();
  }
}
