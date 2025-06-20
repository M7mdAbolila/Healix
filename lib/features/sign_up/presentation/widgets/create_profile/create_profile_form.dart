import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'full_name_field.dart';
import 'phone_number_field.dart';
import 'national_id_field.dart';
import '../../state_management/sign_up_cubit.dart';

class CreateProfileForm extends StatelessWidget {
  const CreateProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return Form(
      key: cubit.profileFormManager.formKey,
      child: Column(
        children: [
          const FullNameField(),
          verticalSpace(24),
          const PhoneNumberField(),
          verticalSpace(24),
          const NationalIdField(),
        ],
      ),
    );
  }
}
