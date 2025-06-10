import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/medical_history/presentation/screens/add_record_bloc_lisneter.dart';
import 'package:healix/features/medical_history/presentation/widgets/upload_report_widget.dart';

import '../../../../core/helpers/enms.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_date_picker_widget.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../logic/medical_history_cubit/medical_history_cubit.dart';

class AddLabTestScreen extends StatelessWidget {
  const AddLabTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MedicalHistoryCubit>();
    cubit.clearForm();
    cubit.medicalHistoryType = MedicalHistoryType.lapTests.index;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            const CustomScreenAppBar(title: 'Lab Test'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      verticalSpace(24),
                      CustomDatePickerWidget(
                        title: 'Test Date',
                        controller: cubit.dateController,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Test Type/ Name',
                        hintText: 'Type Here..',
                        controller: cubit.testNameController,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Specialty',
                        hintText: 'Type Here..',
                        controller: cubit.specialityController,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Clinic/ Lab Name',
                        hintText: 'Type Here..',
                        controller: cubit.clinicNameController,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Notes',
                        hintText: 'Type here any notes..',
                        maxLines: 7,
                        controller: cubit.notesController,
                        textInputAction: TextInputAction.done,
                      ),
                      verticalSpace(16),
                      const UploadAReportWidget(),
                      verticalSpace(32),
                      CustomButton(
                        title: 'Save',
                        onTap: () {
                          cubit.addHistoryRecord();
                        },
                      ),
                      verticalSpace(100),
                      const AddRecordBlocListener(title: 'Lab Test'),
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
