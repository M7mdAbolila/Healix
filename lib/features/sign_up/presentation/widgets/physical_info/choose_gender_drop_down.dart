import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/helpers/logging.dart';

import '../../../../../core/helpers/enms.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/shadows_manager.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../logic/sign_up_cubit/sign_up_cubit.dart';

class ChooseGenderDropDown extends StatefulWidget {
  const ChooseGenderDropDown({super.key});

  @override
  State<ChooseGenderDropDown> createState() => _ChooseGenderDropDownState();
}

class _ChooseGenderDropDownState extends State<ChooseGenderDropDown>
    with TickerProviderStateMixin {
  String? selectedGender;
  bool isExpanded = false;

  void _updateSelection(Gender gender) {
    setState(() {
      selectedGender = gender.name.capitalize();
      context.read<SignUpCubit>().selectedGender = gender.index;
      Logging.info(
          'Selected gender: ${gender.name} with index ${gender.index}');
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
                          children: Gender.values.map((gender) {
                            return _buildMenuItem(gender);
                          }).toList(),
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

  Widget _buildMenuItem(Gender gender) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _updateSelection(gender),
          child: Container(
            padding: EdgeInsets.all(8.r),
            margin: EdgeInsets.only(
                bottom: 16.h, top: gender.index == 0 ? 16.h : 0),
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
                  gender.name.capitalize(),
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
