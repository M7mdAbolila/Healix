import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/shadows_manager.dart';
import '../../../../../core/theming/text_styles.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({
    super.key,
    required this.options,
    required this.onOptionSelected,
  });

  final List<String>? options;
  final Function(String p1) onOptionSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: ColorsManager.blue20,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select option',
            style: AppTextStyles.fontParagraphText(
              color: ColorsManager.grey500,
            ),
          ),
          Column(
            spacing: 8.h,
            children: options!
                .map((option) => GestureDetector(
                      onTap: () => onOptionSelected(option),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [
                            ShadowsManager.softerShadow(),
                          ],
                        ),
                        child: Text(
                          option,
                          style: AppTextStyles.fontTextInput(
                            color: ColorsManager.grey800,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
