import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/dialogs/setup_dialog.dart';
import 'package:healix/core/helpers/extensions.dart';

import '../logic/medical_history_cubit/medical_history_cubit.dart';
import '../logic/medical_history_cubit/medical_history_state.dart';

class AddRecordBlocListener extends StatelessWidget {
  const AddRecordBlocListener({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocListener<MedicalHistoryCubit, MedicalHistoryState>(
      listenWhen: (previous, current) =>
          current is AddHistoryRecordSuccess ||
          current is MedicalHistoryError ||
          current is MedicalHistoryLoading,
      listener: (context, state) {
        if (state is AddHistoryRecordSuccess) {
          context.read<MedicalHistoryCubit>().clearForm();
          context.pop();
          showAwesomeSnackbar(
            context,
            title: title,
            message: 'Record added successfully.',
          );
        } else if (state is MedicalHistoryError) {
          context.pop();
          showAwesomeSnackbar(
            context,
            title: title,
            message: state.errMessage,
            isError: true,
          );
        } else {
          showLoadingDialog(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
