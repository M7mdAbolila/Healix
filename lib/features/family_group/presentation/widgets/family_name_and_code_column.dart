import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class FamilyNameAndCodeColumn extends StatelessWidget {
  const FamilyNameAndCodeColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ahmed’s Family',
          style: AppTextStyles.fontTitleText(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        verticalSpace(8),
        Row(
          children: [
            Text(
              'Family Code: ',
              style: AppTextStyles.fontBodyText(
                color: ColorsManager.darkGreyText,
              ),
            ),
            Text(
              '12345',
              style: AppTextStyles.fontTextInput(
                color: ColorsManager.grey700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
