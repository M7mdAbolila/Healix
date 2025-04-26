import 'package:flutter/material.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/routing/routes.dart';

import '../../../../../core/theming/colors_manager.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: AppTextStyles.fontParagraphText(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        GestureDetector(
          onTap: () => context.pushNamed(Routes.signInScreen),
          child: Text(
            'Log in',
            style: AppTextStyles.fontParagraphText(
              color: ColorsManager.informingColor,
            ).copyWith(
              decoration: TextDecoration.underline,
              decorationColor: ColorsManager.informingColor,
            ),
          ),
        ),
      ],
    );
  }
}
