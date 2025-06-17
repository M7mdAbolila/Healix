import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_date_picker_widget.dart';
import '../../state_management/sign_up_cubit.dart';

class DateOfBirthField extends StatelessWidget {
  const DateOfBirthField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return CustomDatePickerWidget(
      title: 'Date of Birth',
      controller: cubit.physicalFormManager.dateOfBirthController.controller,
    );
  }
}
