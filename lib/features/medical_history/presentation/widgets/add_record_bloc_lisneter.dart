import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/dialogs/setup_dialog.dart';
import 'package:healix/core/helpers/extensions.dart';

import '../state_management/add_medical_record_cubit/add_medical_record_cubit.dart';

class AddRecordBlocListener extends StatelessWidget {
  const AddRecordBlocListener({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMedicalRecordCubit, AddMedicalRecordState>(
      listenWhen: (previous, current) =>
          current is AddMedicalRecordSuccess ||
          current is AddMedicalRecordFailure ||
          current is AddMedicalRecordLoading,
      listener: (context, state) {
        if (state is AddMedicalRecordSuccess) {
          context.pop();
          showAwesomeSnackbar(
            context,
            title: title,
            message: 'Record added successfully.',
          );
        } else if (state is AddMedicalRecordFailure) {
          context.pop();
          showAwesomeSnackbar(
            context,
            title: title,
            message: state.message,
            isError: true,
          );
        } else if (state is AddMedicalRecordLoading) {
          showLoadingDialog(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
