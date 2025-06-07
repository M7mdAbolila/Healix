import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/sign_up/presentation/widgets/physical_info/choose_blood_type.dart';

import '../../../../../core/widgets/custom_date_picker_widget.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/prefix_icon_text_widget.dart';
import '../../logic/sign_up_cubit/sign_up_cubit.dart';
import 'choose_gender_drop_down.dart';

class PhysicalInfoFrom extends StatelessWidget {
  const PhysicalInfoFrom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().physicalInfoFormKey,
      child: Column(
        spacing: 16.h,
        children: [
          CustomDatePickerWidget(
            title: 'Date of Birth',
            controller: context.read<SignUpCubit>().dateOfBirthController,
          ),
          const ChooseBloodTypeWidget(),
          CustomTextFormField(
            title: 'Height',
            hintText: 'How tall are you?',
            prefixIcon: const PrefixIconTextWidget(text: 'CM'),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: context.read<SignUpCubit>().heightController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Height is required';
              } else if (num.tryParse(value) == null || num.parse(value) <= 0) {
                return 'Enter a valid height in centimeters';
              }
              return null;
            },
          ),
          CustomTextFormField(
            title: 'Weight',
            hintText: 'Your current weight',
            prefixIcon: const PrefixIconTextWidget(text: 'K.G'),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            controller: context.read<SignUpCubit>().weightController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Weight is required';
              } else if (num.tryParse(value) == null || num.parse(value) <= 0) {
                return 'Enter a valid weight in kilograms';
              }
              return null;
            },
          ),
          const ChooseGenderDropDown(),
        ],
      ),
    );
  }
}
