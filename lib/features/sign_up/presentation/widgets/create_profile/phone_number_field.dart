import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../core/widgets/prefix_icon_text_widget.dart';
import '../../state_management/sign_up_cubit.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return CustomTextFormField(
      title: 'Phone Number',
      hintText: '01034567891',
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      controller: cubit.profileFormManager.phoneNumberController.controller,
      validator: cubit.validatePhoneNumber,
      prefixIcon: const PrefixIconTextWidget(text: '+20'),
    );
  }
}
