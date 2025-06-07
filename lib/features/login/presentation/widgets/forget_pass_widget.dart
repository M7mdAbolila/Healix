import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      child: InkWell(
        onTap: () => context.pushNamed(Routes.forgetPasswordScreen),
        borderRadius: BorderRadius.circular(4.r),
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Text(
            'Forgot Password?',
            style: AppTextStyles.fontParagraphText(
              color: ColorsManager.darkerGreyText,
            ).copyWith(
              decoration: TextDecoration.underline,
              decorationColor: ColorsManager.darkerGreyText,
            ),
          ),
        ),
      ),
    );
  }
}
