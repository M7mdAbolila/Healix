import 'package:flutter/material.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/widgets/custom_text_form_field.dart';
import '../../../../core/helpers/spacing.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isVisible = false;
  bool isConfirmVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(
          title: 'Email',
          hintText: 'i.e example@gmail.com',
        ),
        verticalSpace(16),
        CustomTextFormField(
          title: 'Password',
          hintText: 'Create New Password',
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
        ),
        verticalSpace(16),
        CustomTextFormField(
          title: 'Confirm Password',
          hintText: 'Confirm Your New Password',
          isObscureText: isConfirmVisible,
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
        ),
      ],
    );
  }
}
