import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../state_management/sign_up_cubit.dart';

class NationalIdField extends StatelessWidget {
  const NationalIdField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return CustomTextFormField(
      title: 'National ID',
      hintText: 'Your National ID or Passport Number',
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      controller: cubit.profileFormManager.nationalIdController.controller,
      validator: cubit.validateNationalId,
    );
  }
}
