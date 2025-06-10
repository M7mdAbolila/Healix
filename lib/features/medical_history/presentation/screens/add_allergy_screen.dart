import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/medical_history/presentation/widgets/allergin_status_drop_down.dart';
import 'package:healix/features/medical_history/presentation/widgets/reaction_severity_drop_down.dart';

import '../../../../core/helpers/enms.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_date_picker_widget.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../logic/medical_history_cubit/medical_history_cubit.dart';

class AddAllergyScreen extends StatelessWidget {
  const AddAllergyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final medicalHistoryCubit = context.read<MedicalHistoryCubit>();
    medicalHistoryCubit.clearForm();
    medicalHistoryCubit.medicalHistoryType = MedicalHistoryType.allergy.index;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            const CustomScreenAppBar(title: 'Allergy'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      verticalSpace(24),
                      CustomDatePickerWidget(
                        title: 'Date Of Onset',
                        controller: medicalHistoryCubit.dateController,
                      ),
                      verticalSpace(16),
                      CustomTextFormField(
                        title: 'Allergen',
                        hintText: 'e.g., Penicillin, Pollen, Food',
                        controller: medicalHistoryCubit.allergenController,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(16),
                      const ReactionSeverityDropDown(),
                      verticalSpace(16),
                      const AllergyStatusDropDown(),
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
