import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/enms.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_date_picker_widget.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../logic/medical_history_cubit/medical_history_cubit.dart';
import '../widgets/upload_report_widget.dart';

class AddLogsScreen extends StatelessWidget {
  const AddLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final medicalHistoryCubit = context.read<MedicalHistoryCubit>();
    medicalHistoryCubit.clearForm();
    medicalHistoryCubit.medicalHistoryType = MedicalHistoryType.logs.index;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            const CustomScreenAppBar(title: 'Logs'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      verticalSpace(24),
                      CustomDatePickerWidget(
                        title: 'Log Date',
                        controller: medicalHistoryCubit.dateController,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Log Type',
                        hintText: 'Type Here..',
                        controller: medicalHistoryCubit.logTypeController,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Specialty',
                        hintText: 'Type Here..',
                        controller: medicalHistoryCubit.specialityController,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Value',
                        hintText: 'Type Here..',
                        controller: medicalHistoryCubit.logValueController,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Notes',
                        hintText: 'Type here any notes..',
                        maxLines: 7,
                        controller: medicalHistoryCubit.notesController,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      const UploadAReportWidget(),
                      verticalSpace(32),
                      CustomButton(
                        title: 'Save',
                        onTap: () {
                          medicalHistoryCubit.addHistoryRecord();
                        },
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
