import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/helpers/spacing.dart';

import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/shadows_manager.dart';
import '../../../../../core/theming/text_styles.dart';

class ChooseGenderDropDown extends StatefulWidget {
  const ChooseGenderDropDown({super.key});

  @override
  State<ChooseGenderDropDown> createState() => _ChooseGenderDropDownState();
}

class _ChooseGenderDropDownState extends State<ChooseGenderDropDown>
    with TickerProviderStateMixin {
  String? selectedGender;
  bool isExpanded = false;

  void _updateSelection(String gender) {
    setState(() {
      selectedGender = gender;
      isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkGreyText,
          ),
        ),
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                ShadowsManager.softerShadow(),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      selectedGender ?? 'Choose your gender',
                      style: AppTextStyles.fontTextInput(
                        color: selectedGender.isNullOrEmpty()
                            ? ColorsManager.grey500
                            : ColorsManager.grey800,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                        color: ColorsManager.lightGreyText,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0.0,
                        duration: const Duration(milliseconds: 550),
                        curve: Curves.easeInOut,
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20.sp,
                          color: ColorsManager.darkGreyText,
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 550),
                  curve: Curves.easeInOut,
                  child: isExpanded
                      ? Column(
                          children: [
                            verticalSpace(16),
                            _buildMenuItem('Male'),
                            _buildMenuItem('Female'),
                          ],
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(String gender) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _updateSelection(gender),
          child: Container(
            padding: EdgeInsets.all(8.r),
            margin: EdgeInsets.only(bottom: 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                ShadowsManager.softerShadow(),
              ],
            ),
            child: Row(
              children: [
                Text(
                  gender,
                  style: AppTextStyles.fontTextInput(
                    color: ColorsManager.grey800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
