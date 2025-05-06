import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/core/widgets/custom_date_picker_widget.dart';
import 'package:healix/core/widgets/custom_text_form_field.dart';
import 'package:healix/features/medical_history/presentation/widgets/add_prescription_widget.dart';
import 'package:healix/features/medical_history/presentation/widgets/visit_or_follow_up_button.dart';

import '../../../../core/widgets/custom_screen_app_bar.dart';

class AddMedicalVisitScreen extends StatelessWidget {
  const AddMedicalVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            const CustomScreenAppBar(title: 'Medical Visit'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      verticalSpace(24),
                      CustomDatePickerWidget(
                        title: 'Visit Date',
                        controller: TextEditingController(),
                      ),
                      verticalSpace(16),
                      const VisitOrFollowUpButton(),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Doctor\'s Name',
                        hintText: 'Type Here..',
                        controller: TextEditingController(),
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Specialty',
                        hintText: 'Type Here..',
                        controller: TextEditingController(),
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Clinic/ Hospital Name',
                        hintText: 'Type Here..',
                        controller: TextEditingController(),
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Medical Diagnoses',
                        hintText: 'Type Here..',
                        controller: TextEditingController(),
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Notes',
                        hintText: 'Type here any notes..',
                        maxLines: 7,
                        controller: TextEditingController(),
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      const AddPrescriptionWidget(),
                      verticalSpace(32),
                      CustomButton(
                        title: 'Save',
                        onTap: () {},
                      ),
                      verticalSpace(100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
