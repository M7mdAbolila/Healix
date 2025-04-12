import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class ForgotPassWidget extends StatelessWidget {
  const ForgotPassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        'Forgot Password?',
        style: AppTextStyles.fontParagraphText(
          color: ColorsManager.darkerGreyText,
        ).copyWith(
            decoration: TextDecoration.underline,
            decorationColor: ColorsManager.darkerGreyText),
      ),
    );
  }
}
