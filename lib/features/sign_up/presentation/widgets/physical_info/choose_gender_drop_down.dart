import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/helpers/logging.dart';
import 'package:healix/core/widgets/custom_dropdown.dart';

import '../../../../../core/helpers/enms.dart';
import '../../logic/sign_up_cubit/sign_up_cubit.dart';

class ChooseGenderDropDown extends StatelessWidget {
  const ChooseGenderDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedDropdown<Gender>(
      label: 'Gender',
      placeholder: 'Choose your gender',
      items: Gender.values,
      displayText: (gender) => gender.name.capitalize(),
      onSelectionChanged: (gender) {
        context.read<SignUpCubit>().selectedGender = gender.index;
        Logging.info(
            'Selected gender: ${gender.name} with index ${gender.index}');
      },
    );
  }
}
