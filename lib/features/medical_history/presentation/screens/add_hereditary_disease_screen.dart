import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/widgets/custom_button.dart';

import '../../../../core/helpers/enms.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_date_picker_widget.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../logic/medical_history_cubit/medical_history_cubit.dart';
import '../widgets/add_record_bloc_lisneter.dart';

class AddHereditaryDiseaseScreen extends StatelessWidget {
  const AddHereditaryDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final medicalHistoryCubit = context.read<MedicalHistoryCubit>();
    medicalHistoryCubit.clearForm();
    medicalHistoryCubit.medicalHistoryType =
        MedicalHistoryType.hereditary.index;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            const CustomScreenAppBar(title: 'Hereditary Disease'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      verticalSpace(24),
                      CustomDatePickerWidget(
                        title: 'Date Of Diagnosis',
                        controller: medicalHistoryCubit.dateController,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Specialty',
                        hintText: 'Type Here..',
                        controller: medicalHistoryCubit.logTypeController,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Name of Disease',
                        hintText: 'Type Here..',
                        controller: medicalHistoryCubit.diseaseNameController,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'How Old Were You When You Diagnosed?',
                        hintText: 'Type Here..',
                        controller:
                            medicalHistoryCubit.lastTimeDiagnosedController,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Family Infection Spread Level',
                        hintText: 'Default Text Field Content',
                        controller: medicalHistoryCubit
                            .familyInfectionSpreadLevelController,
                        textInputAction: TextInputAction.next,
                      ),
                      CustomTextFormField(
                        title: 'Notes',
                        hintText: 'Type here any notes..',
                        maxLines: 7,
                        controller: medicalHistoryCubit.notesController,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(32),
                      CustomButton(
                        title: 'Save',
                        onTap: () {
                          medicalHistoryCubit.addHistoryRecord();
                        },
                      ),
                      verticalSpace(100),
                      const AddRecordBlocListener(title: 'Hereditary Disease'),
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
