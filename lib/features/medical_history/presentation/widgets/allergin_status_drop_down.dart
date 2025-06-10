import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/helpers/extensions.dart';

import '../../../../core/helpers/enms.dart';
import '../../../../core/widgets/custom_dropdown.dart';
import '../logic/medical_history_cubit/medical_history_cubit.dart';

class AllergyStatusDropDown extends StatelessWidget {
  const AllergyStatusDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedDropdown<AllergyStatus>(
      label: 'Allergy Status',
      placeholder: 'Choose Allergy status',
      items: AllergyStatus.values,
      displayText: (item) => item.name.capitalize(),
      onSelectionChanged: (item) {
        context.read<MedicalHistoryCubit>().allergyStatus = item.index;
      },
    );
  }
}
