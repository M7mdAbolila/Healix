import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/di/setup_get_it.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/core/widgets/custom_date_picker_widget.dart';
import 'package:healix/core/widgets/custom_text_form_field.dart';
import 'package:healix/features/medical_history/presentation/widgets/add_prescription_widget.dart';

import '../../../../core/helpers/enms.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
import '../../domain/entities/history_record_entity.dart';
import '../form_managers/medical_visit_form_manager.dart';
import '../state_management/add_medical_record_cubit/add_medical_record_cubit.dart';
import '../widgets/add_record_bloc_lisneter.dart';
import '../widgets/visit_or_follow_up_button.dart';

class AddMedicalVisitScreen extends StatelessWidget {
  const AddMedicalVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddMedicalRecordCubit>(),
      child: const _AddMedicalVisitView(),
    );
  }
}

class _AddMedicalVisitView extends StatefulWidget {
  const _AddMedicalVisitView();

  @override
  State<_AddMedicalVisitView> createState() => _AddMedicalVisitViewState();
}

class _AddMedicalVisitViewState extends State<_AddMedicalVisitView> {
  final MedicalVisitFormManager _formManager = MedicalVisitFormManager();

  @override
  void initState() {
    super.initState();
    context
        .read<AddMedicalRecordCubit>()
        .setMedicalHistoryType(MedicalHistoryType.medicalVisit.index);
  }

  @override
  void dispose() {
    _formManager.dispose();
    super.dispose();
  }

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
                  child: Form(
                    key: _formManager.formKey,
                    child: Column(
                      children: [
                        verticalSpace(24),
                        CustomDatePickerWidget(
                          title: 'Visit Date',
                          controller: _formManager.dateController.controller,
                        ),
                        verticalSpace(16),
                        VisitOrFollowUpButton(
                          formManager: _formManager,
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          title: 'Doctor\'s Name',
                          hintText: 'Type Here..',
                          controller:
                              _formManager.doctorNameController.controller,
                          textInputAction: TextInputAction.next,
                          validator: (value) => context
                              .read<AddMedicalRecordCubit>()
                              .validateRequiredField(value, 'Doctor name'),
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          title: 'Speciality',
                          hintText: 'Type Here..',
                          controller:
                              _formManager.specialityController.controller,
                          textInputAction: TextInputAction.next,
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          title: 'Clinic Name',
                          hintText: 'Type Here..',
                          controller:
                              _formManager.clinicNameController.controller,
                          textInputAction: TextInputAction.next,
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          title: 'Medical Diagnosis',
                          hintText: 'Type Here..',
                          controller: _formManager
                              .medicalDiagnosesController.controller,
                          textInputAction: TextInputAction.next,
                          maxLines: 3,
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          title: 'Notes',
                          hintText: 'Type Here..',
                          controller: _formManager.notesController.controller,
                          textInputAction: TextInputAction.done,
                          maxLines: 3,
                        ),
                        verticalSpace(16),
                        const AddPrescriptionWidget(),
                        verticalSpace(24),
                        BlocBuilder<AddMedicalRecordCubit,
                            AddMedicalRecordState>(
                          builder: (context, state) {
                            return CustomButton(
                              title: 'Add Record',
                              onTap: () => _submitForm(),
                              enable: state is! AddMedicalRecordLoading,
                            );
                          },
                        ),
                        verticalSpace(32),
                        const AddRecordBlocListener(title: 'Medical Visit'),
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

  void _submitForm() {
    if (_formManager.validateForm()) {
      final record = HistoryRecordEntity(
        date: DateTime.tryParse(_formManager.dateController.value),
        doctorName: _formManager.doctorNameController.value,
        speciality: _formManager.specialityController.value,
        clinicName: _formManager.clinicNameController.value,
        medicalDiagnoses: _formManager.medicalDiagnosesController.value,
        notes: _formManager.notesController.value,
        isFirstTime: _formManager.isFirstTime,
      );

      context.read<AddMedicalRecordCubit>().addMedicalRecord(record);
    }
  }
}
