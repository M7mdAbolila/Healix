import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';
import '../theming/text_styles.dart';

class FeatureTitleText extends StatelessWidget {
  const FeatureTitleText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.fontTextInput(
        color: ColorsManager.darkerGreyText,
      ),
    );
  }
}
