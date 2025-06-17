import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../state_management/sign_up_cubit.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return CustomTextFormField(
      title: 'Email',
      hintText: 'i.e example@gmail.com',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: cubit.signUpFormManager.emailController.controller,
      validator: cubit.validateEmail,
    );
  }
}
