import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../state_management/sign_up_cubit.dart';

class FullNameField extends StatelessWidget {
  const FullNameField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return CustomTextFormField(
      title: 'Full Name',
      hintText: 'ie. Mohamed Ali',
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      controller: cubit.profileFormManager.fullNameController.controller,
      validator: cubit.validateFullName,
    );
  }
}
