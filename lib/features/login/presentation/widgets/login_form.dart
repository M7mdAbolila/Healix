import 'package:flutter/material.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/helpers/app_regex.dart';
import 'package:healix/core/widgets/custom_text_form_field.dart';
import '../../../../core/helpers/spacing.dart';

class EmailAndPasswordForm extends StatefulWidget {
  const EmailAndPasswordForm({
    super.key,
  });

  @override
  State<EmailAndPasswordForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<EmailAndPasswordForm> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          title: 'Email',
          hintText: 'i.e example@gmail.com',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (v) {
            if (v!.isEmpty) {
              return 'Email is required';
            } else if (!AppRegex.isEmailValid(v)) {
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
            } else if (v.length < 6) {
              return 'Use at least 8 characters with a mix of uppercase, lowercase, numbers, and special symbols; avoid common words, personal info, and repeated patterns. ';
            }
            return null;
          },
        ),
      ],
    );
  }
}
