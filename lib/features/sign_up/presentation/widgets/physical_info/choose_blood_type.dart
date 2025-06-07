import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/constants/constants.dart';
import 'package:healix/core/dialogs/show_blood_type_dialog.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/shadows_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/features/sign_up/presentation/logic/sign_up_cubit/sign_up_cubit.dart';

import '../../../../../core/helpers/spacing.dart';

class ChooseBloodTypeWidget extends StatefulWidget {
  const ChooseBloodTypeWidget({super.key});

  @override
  State<ChooseBloodTypeWidget> createState() => _ChooseBloodTypeWidgetState();
}

class _ChooseBloodTypeWidgetState extends State<ChooseBloodTypeWidget> {
  int? _selectedBloodType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Blood Type',
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkGreyText,
          ),
        ),
        verticalSpace(8),
        GestureDetector(
          onTap: () async {
            int? selectedBloodTypeIndex =
                await showCustomBloodTypeDialog(context);
            setState(() {
              if (selectedBloodTypeIndex != null) {
                _selectedBloodType = selectedBloodTypeIndex;
                context.read<SignUpCubit>().selectedBloodType =
                    selectedBloodTypeIndex;
              }
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                ShadowsManager.softerShadow(),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedBloodType == null
                      ? 'Select Blood Type'
                      : bloodTypes[_selectedBloodType!],
                  style: AppTextStyles.fontTextInput(
                    color: _selectedBloodType == null
                        ? ColorsManager.lightGreyText
                        : ColorsManager.darkGreyText,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    color: ColorsManager.lightGreyText,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 20.sp,
                    color: ColorsManager.darkGreyText,
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
