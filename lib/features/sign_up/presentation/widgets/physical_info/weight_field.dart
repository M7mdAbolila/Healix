import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../core/widgets/prefix_icon_text_widget.dart';
import '../../state_management/sign_up_cubit.dart';

class WeightField extends StatelessWidget {
  const WeightField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return CustomTextFormField(
      title: 'Weight',
      hintText: 'Your current weight',
      prefixIcon: const PrefixIconTextWidget(text: 'K.G'),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      controller: cubit.physicalFormManager.weightController.controller,
      validator: (value) => cubit.validateNumericField(value, 'Weight'),
    );
  }
}
