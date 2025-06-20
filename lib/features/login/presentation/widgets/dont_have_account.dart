import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/theming/text_styles.dart';

import '../../../../core/theming/colors_manager.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: AppTextStyles.fontParagraphText(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        InkWell(
          onTap: () => context.pop(),
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Text(
              'Sign up',
              style: AppTextStyles.fontParagraphText(
                color: ColorsManager.informingColor,
              ).copyWith(
                decoration: TextDecoration.underline,
                decorationColor: ColorsManager.informingColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
