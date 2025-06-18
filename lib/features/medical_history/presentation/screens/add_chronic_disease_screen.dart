import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/enms.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_date_picker_widget.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/di/setup_get_it.dart';
import '../../domain/entities/history_record_entity.dart';
import '../form_managers/chronic_disease_form_manager.dart';
import '../state_management/add_medical_record_cubit/add_medical_record_cubit.dart';
import '../widgets/risk_level_drop_down.dart';
import '../widgets/add_record_bloc_lisneter.dart';

class AddChronicDiseaseScreen extends StatelessWidget {
  const AddChronicDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddMedicalRecordCubit>(),
      child: const _AddChronicDiseaseView(),
    );
  }
}

class _AddChronicDiseaseView extends StatefulWidget {
  const _AddChronicDiseaseView();

  @override
  State<_AddChronicDiseaseView> createState() => _AddChronicDiseaseViewState();
}

class _AddChronicDiseaseViewState extends State<_AddChronicDiseaseView> {
  final ChronicDiseaseFormManager _formManager = ChronicDiseaseFormManager();

  @override
  void initState() {
    super.initState();
    context
        .read<AddMedicalRecordCubit>()
        .setMedicalHistoryType(MedicalHistoryType.chronic.index);
  }

  @override
  void dispose() {
    _formManager.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formManager.validateForm()) {
      final record = HistoryRecordEntity(
        date: DateTime.tryParse(_formManager.dateController.value),
        speciality: _formManager.specialityController.value,
        diseaseName: _formManager.diseaseNameController.value,
        supervisedBy: _formManager.supervisedByController.value,
        riskLevel: _formManager.riskLevel,
        notes: _formManager.notesController.value.isNotEmpty
            ? _formManager.notesController.value
            : null,
      );

      context.read<AddMedicalRecordCubit>().addMedicalRecord(record);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Form(
                    key: _formManager.formKey,
                    child: Column(
                      children: [
                        verticalSpace(24),
                        CustomDatePickerWidget(
                          title: 'Date Of Diagnosis',
                          controller: _formManager.dateController.controller,
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          title: 'Specialty',
                          hintText: 'Type Here..',
                          controller:
                              _formManager.specialityController.controller,
                          textInputAction: TextInputAction.next,
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          title: 'Name of Disease',
                          hintText: 'Type Here..',
                          controller:
                              _formManager.diseaseNameController.controller,
                          textInputAction: TextInputAction.next,
                        ),
                        verticalSpace(16),
                        RiskLevelDropDown(
                          initialValue: _formManager.riskLevel,
                          onRiskLevelChanged: (value) {
                            setState(() {
                              _formManager.riskLevel = value;
                            });
                          },
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          title: 'Supervised By',
                          hintText: 'Type Here..',
                          controller:
                              _formManager.supervisedByController.controller,
                          textInputAction: TextInputAction.next,
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          title: 'Notes',
                          hintText: 'Type here any notes..',
                          maxLines: 7,
                          controller: _formManager.notesController.controller,
                          textInputAction: TextInputAction.done,
                        ),
                        verticalSpace(32),
                        BlocBuilder<AddMedicalRecordCubit,
                            AddMedicalRecordState>(
                          builder: (context, state) {
                            return CustomButton(
                              title: 'Save',
                              onTap: () => _submitForm(),
                              enable: state is! AddMedicalRecordLoading,
                            );
                          },
                        ),
                        verticalSpace(100),
                        const AddRecordBlocListener(title: 'Chronic Disease'),
                      ],
                    ),
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
