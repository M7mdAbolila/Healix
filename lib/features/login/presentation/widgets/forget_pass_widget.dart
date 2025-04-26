import 'package:flutter/material.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/routing/routes.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class ForgotPassWidget extends StatelessWidget {
  const ForgotPassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => context.pushNamed(Routes.forgetPasswordScreen),
        child: Text(
          'Forgot Password?',
          style: AppTextStyles.fontParagraphText(
            color: ColorsManager.darkerGreyText,
          ).copyWith(
              decoration: TextDecoration.underline,
              decorationColor: ColorsManager.darkerGreyText),
        ),
      ),
    );
  }
}
