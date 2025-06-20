import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';
import '../theming/text_styles.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'View all', 
        style: AppTextStyles.fontParagraphText(
          color: ColorsManager.primaryColor,
        ).copyWith(
          decoration: TextDecoration.underline,
          decorationColor: ColorsManager.primaryColor,
        ),
      ),
    );
  }
}
