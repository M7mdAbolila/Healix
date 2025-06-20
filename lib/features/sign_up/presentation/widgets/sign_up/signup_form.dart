import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/spacing.dart';
import 'email_field.dart';
import 'password_field.dart';
import '../../state_management/sign_up_cubit.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return Form(
      key: cubit.signUpFormManager.emailFormKey,
      child: Column(
        children: [
          const EmailField(),
          verticalSpace(16),
          const PasswordField(),
          verticalSpace(16),
          const PasswordField(isConfirmPassword: true),
        ],
      ),
    );
  }
}
