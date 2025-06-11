import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/medical_history/presentation/widgets/risk_level_drop_down.dart';

import '../../../../core/helpers/enms.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_date_picker_widget.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../logic/medical_history_cubit/medical_history_cubit.dart';
import '../widgets/add_record_bloc_lisneter.dart';

class AddChronicDiseaseScreen extends StatelessWidget {
  const AddChronicDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final medicalHistoryCubit = context.read<MedicalHistoryCubit>();
    medicalHistoryCubit.clearForm();
    medicalHistoryCubit.medicalHistoryType = MedicalHistoryType.chronic.index;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            const CustomScreenAppBar(title: 'Chronic Disease'),
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
                        controller: medicalHistoryCubit.specialityController,
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
                      const RiskLevelDropDown(),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Supervised By',
                        hintText: 'Type Here..',
                        controller: medicalHistoryCubit.supervisedByController,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Notes',
                        hintText: 'Type here any notes..',
                        maxLines: 7,
                        controller: medicalHistoryCubit.notesController,
                        textInputAction: TextInputAction.done,
                      ),
                      verticalSpace(32),
                      CustomButton(
                        title: 'Save',
                        onTap: () {
                          medicalHistoryCubit.addHistoryRecord();
                        },
                      ),
                      verticalSpace(100),
                      const AddRecordBlocListener(title: 'Chronic Disease'),
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
