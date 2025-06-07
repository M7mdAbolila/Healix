import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/helpers/app_regex.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/widgets/custom_text_form_field.dart';
import '../../../../core/helpers/spacing.dart';
import '../logic/login_cubit.dart';

class EmailAndPasswordForm extends StatefulWidget {
  const EmailAndPasswordForm({
    super.key,
  });

  @override
  State<EmailAndPasswordForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<EmailAndPasswordForm> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().loginFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            title: 'Email',
            hintText: 'i.e example@gmail.com',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            controller: context.read<LoginCubit>().email,
            validator: (v) {
              final String? value = v?.trim();
              if (value.isNullOrEmpty()) {
                return 'Email is required';
              } else if (!AppRegex.isEmailValid(value!)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          verticalSpace(16),
          CustomTextFormField(
            title: 'Password',
            hintText: 'Enter Your Password',
            keyboardType: TextInputType.visiblePassword,
            controller: context.read<LoginCubit>().password,
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
                return 'Use at least 8 characters with a mix of uppercase, lowercase, numbers, and special symbols.';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
