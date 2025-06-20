import 'package:flutter/material.dart';
import 'package:healix/core/helpers/extensions.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class FamilyNameAndCodeColumn extends StatelessWidget {
  const FamilyNameAndCodeColumn({
    super.key,
    this.familyName,
    this.familyCode,
  });
  final String? familyName;
  final String? familyCode;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          familyName.isNullOrEmpty()
              ? 'Create New Family Group'
              : '$familyName\'s Family',
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
              familyCode ?? "Automatically Generated",
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
