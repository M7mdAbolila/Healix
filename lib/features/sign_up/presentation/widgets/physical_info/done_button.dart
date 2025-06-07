import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/dialogs/setup_dialog.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../logic/sign_up_cubit/sign_up_cubit.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: 'Done',
      onTap: () {
        final cubit = context.read<SignUpCubit>();
        if (cubit.dateOfBirthController.text.isEmpty) {
          showAwesomeSnackbar(
            context,
            title: 'Feild Required',
            message: 'Date of Birth is required',
            isWarning: true,
          );
        } else if (cubit.selectedBloodType == null) {
          showAwesomeSnackbar(
            context,
            title: 'Feild Required',
            message: 'Blood Type is required',
            isWarning: true,
          );
        } else if (cubit.selectedGender == null) {
          showAwesomeSnackbar(
            context,
            title: 'Feild Required',
            message: 'Gender is required',
            isWarning: true,
          );
        } else if (cubit.physicalInfoFormKey.currentState!.validate()) {
          cubit.signUp();
        }
      },
    );
  }
}
