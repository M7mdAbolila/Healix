import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/medical_history/presentation/widgets/upload_report_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_date_picker_widget.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class AddXRayScreen extends StatelessWidget {
  const AddXRayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            const CustomScreenAppBar(title: 'X-Ray/ECG'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      verticalSpace(24),
                      CustomDatePickerWidget(
                        title: 'Scan Date',
                        controller: TextEditingController(),
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Scan Type',
                        hintText: 'Type Here..',
                        controller: TextEditingController(),
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Scan Name',
                        hintText: 'Type Here..',
                        controller: TextEditingController(),
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Facility Name',
                        hintText: 'Type Here..',
                        controller: TextEditingController(),
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Scanned Part',
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
                      const UploadAReportWidget(),
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
