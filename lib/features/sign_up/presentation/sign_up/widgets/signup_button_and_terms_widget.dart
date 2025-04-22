import 'package:flutter/material.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/routing/routes.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_check_box.dart';
import '../../../../../core/helpers/spacing.dart';

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
          onTap: () => context.pushNamed(Routes.verifyEmailScreen),
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
