import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/widgets/custom_dropdown.dart';

import '../../../../core/helpers/enms.dart';
import '../logic/medical_history_cubit/medical_history_cubit.dart';

class ReactionSeverityDropDown extends StatelessWidget {
  const ReactionSeverityDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedDropdown<ReactionSeverity>(
      label: 'Reaction Severity',
      placeholder: 'Choose severity',
      items: ReactionSeverity.values,
      displayText: (item) => item.name.capitalize(),
      onSelectionChanged: (item) {
        context.read<MedicalHistoryCubit>().reactionSeverity = item.index;
      },
    );
  }
}
