import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/dialogs/setup_dialog.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../state_management/sign_up_cubit.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: 'Done',
      onTap: () {
        final cubit = context.read<SignUpCubit>();
        if (cubit.physicalFormManager.dateOfBirthController.value.isEmpty) {
          showAwesomeSnackbar(
            context,
            title: 'Field Required',
            message: 'Date of Birth is required',
            isWarning: true,
          );
        } else if (cubit.selectedBloodType == null) {
          showAwesomeSnackbar(
            context,
            title: 'Field Required',
            message: 'Blood Type is required',
            isWarning: true,
          );
        } else if (cubit.selectedGender == null) {
          showAwesomeSnackbar(
            context,
            title: 'Field Required',
            message: 'Gender is required',
            isWarning: true,
          );
        } else if (cubit.physicalFormManager.formKey.currentState!.validate()) {
          cubit.signUp();
        }
      },
    );
  }
}
