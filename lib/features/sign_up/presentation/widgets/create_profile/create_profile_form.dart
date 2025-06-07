import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/helpers/app_regex.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/prefix_icon_text_widget.dart';
import '../../logic/sign_up_cubit/sign_up_cubit.dart';

class CreateProfileForm extends StatelessWidget {
  const CreateProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().createProfileFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            title: 'Full Name',
            hintText: 'ie. Mohamemd Ali',
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            controller: context.read<SignUpCubit>().fullNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Full name is required';
              }
              return null;
            },
          ),
          verticalSpace(24),
          CustomTextFormField(
            title: 'Phone Number',
            hintText: '01034567891',
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            controller: context.read<SignUpCubit>().phoneNumberController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Phone number is required';
              } else if (!AppRegex.isPhoneNumberValid(value)) {
                return 'Enter a valid phone number';
              }
              return null;
            },
            prefixIcon: const PrefixIconTextWidget(text: '+20'),
          ),
          verticalSpace(24),
          CustomTextFormField(
            title: 'National ID',
            hintText: 'Your National ID or Passport Number',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            controller: context.read<SignUpCubit>().nationalIdController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'National ID is required';
              } else if (!AppRegex.isEgyptianNationalIdValid(value)) {
                return 'Enter a valid National ID';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
