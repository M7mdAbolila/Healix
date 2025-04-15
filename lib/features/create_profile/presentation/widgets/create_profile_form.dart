import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/app_regex.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/widgets/custom_text_form_field.dart';
import 'package:healix/features/create_profile/presentation/widgets/text_field_with_prefix_text.dart';

class CreateProfileForm extends StatelessWidget {
  const CreateProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 16.w,
          children: [
            Expanded(
              child: CustomTextFormField(
                title: 'First Name',
                hintText: 'ie. Mohamemd',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'First name is required';
                  }
                  return null;
                },
              ),
            ),
            Expanded(
              child: CustomTextFormField(
                title: 'Last Name',
                hintText: 'ie. Ali',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Last name is required';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        verticalSpace(24),
        TextFieldWithPrifixText(
          title: 'Phone Number',
          hintText: '01234567891',
          prefixText: '+20',
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Phone number is required';
            } else if (!AppRegex.isPhoneNumberValid(value)) {
              return 'Enter a valid phone number';
            }
            return null;
          },
        ),
        verticalSpace(24),
        CustomTextFormField(
          title: 'National ID',
          hintText: 'Your National ID or Passport Number',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
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
    );
  }
}
