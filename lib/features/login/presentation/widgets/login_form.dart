import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/helpers/spacing.dart';
import '../state_management/login_cubit.dart';
import '../state_management/login_state.dart';
import 'password_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        final formManager = cubit.formManager;

        return Form(
          key: formManager.formKey,
          child: Column(
            children: [
              _buildEmailField(context, state),
              verticalSpace(16),
              _buildPasswordField(context, state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmailField(BuildContext context, LoginState state) {
    final cubit = context.read<LoginCubit>();
    final emailController = cubit.formManager.emailController;

    return CustomTextFormField(
      title: 'Email',
      hintText: 'i.e example@gmail.com',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: emailController.controller,
      validator: cubit.validateEmail,
    );
  }

  Widget _buildPasswordField(BuildContext context, LoginState state) {
    final cubit = context.read<LoginCubit>();
    final passwordController = cubit.formManager.passwordController;

    return PasswordField(
      title: 'Password',
      hintText: 'Enter Your Password',
      controller: passwordController.controller,
      validator: cubit.validatePassword,
    );
  }
}
