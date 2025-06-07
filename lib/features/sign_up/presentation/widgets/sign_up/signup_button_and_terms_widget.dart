import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_check_box.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../logic/sign_up_cubit/sign_up_cubit.dart';

class SignUpButtonAndTermsWidget extends StatefulWidget {
  const SignUpButtonAndTermsWidget({
    super.key,
  });

  @override
  State<SignUpButtonAndTermsWidget> createState() =>
      _SignUpButtonAndTermsWidgetState();
}

class _SignUpButtonAndTermsWidgetState
    extends State<SignUpButtonAndTermsWidget> {
  bool _isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          title: 'Sign up',
          enable: _isAgree,
          onTap: () {
            FocusScope.of(context).unfocus();
            if (context
                .read<SignUpCubit>()
                .signUpFormKey
                .currentState!
                .validate()) {
              context.read<SignUpCubit>().verifyEmail();
            }
          },
        ),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I Agree to all of the ',
              style: AppTextStyles.fontParagraphText(
                color: ColorsManager.darkerGreyText,
              ),
            ),
            Text(
              'Terms & Conditions',
              style: AppTextStyles.fontParagraphText(
                color: ColorsManager.informingColor,
              ).copyWith(
                decoration: TextDecoration.underline,
                decorationColor: ColorsManager.informingColor,
              ),
            ),
            const Spacer(),
            CustomCheckbox(
              initialValue: _isAgree,
              onChanged: (value) {
                setState(() {
                  _isAgree = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
