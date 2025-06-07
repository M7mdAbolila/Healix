import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/widgets/custom_text_form_field.dart';
import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../logic/sign_up_cubit/sign_up_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isVisible = true;
  bool isConfirmVisible = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().signUpFormKey,
      child: Column(
        children: [
          CustomTextFormField(
              title: 'Email',
              hintText: 'i.e example@gmail.com',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: context.read<SignUpCubit>().emailController,
              validator: (v) {
                if (v!.isEmpty) {
                  return 'Email is required';
                } else if (!AppRegex.isEmailValid(v)) {
                  return 'Enter a valid email';
                }
                return null;
              }),
          verticalSpace(16),
          CustomTextFormField(
            title: 'Password',
            hintText: 'Create New Password',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            isObscureText: isVisible,
            controller: context.read<SignUpCubit>().passwordController,
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
          verticalSpace(16),
          CustomTextFormField(
            title: 'Confirm Password',
            hintText: 'Confirm Your New Password',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            isObscureText: isConfirmVisible,
            controller: context.read<SignUpCubit>().confirmPasswordController,
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
