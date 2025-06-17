import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/sign_up/presentation/widgets/physical_info/choose_blood_type.dart';

import 'date_of_birth_field.dart';
import 'height_field.dart';
import 'weight_field.dart';
import '../../state_management/sign_up_cubit.dart';
import 'choose_gender_drop_down.dart';

class PhysicalInfoFrom extends StatelessWidget {
  const PhysicalInfoFrom({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return Form(
      key: cubit.physicalFormManager.formKey,
      child: Column(
        spacing: 16.h,
        children: const [
          DateOfBirthField(),
          ChooseBloodTypeWidget(),
          HeightField(),
          WeightField(),
          ChooseGenderDropDown(),
        ],
      ),
    );
  }
}
