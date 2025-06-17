import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../core/widgets/prefix_icon_text_widget.dart';
import '../../state_management/sign_up_cubit.dart';

class HeightField extends StatelessWidget {
  const HeightField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return CustomTextFormField(
      title: 'Height',
      hintText: 'How tall are you?',
      prefixIcon: const PrefixIconTextWidget(text: 'CM'),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      controller: cubit.physicalFormManager.heightController.controller,
      validator: (value) => cubit.validateNumericField(value, 'Height'),
    );
  }
}
