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
import '../form_managers/surgery_form_manager.dart';
import '../state_management/add_medical_record_cubit/add_medical_record_cubit.dart';
import '../widgets/upload_report_widget.dart';
import '../widgets/add_record_bloc_lisneter.dart';

class AddSurgeryScreen extends StatelessWidget {
  const AddSurgeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddMedicalRecordCubit>(),
      child: const _AddSurgeryView(),
    );
  }
}

class _AddSurgeryView extends StatefulWidget {
  const _AddSurgeryView();

  @override
  State<_AddSurgeryView> createState() => _AddSurgeryViewState();
}

class _AddSurgeryViewState extends State<_AddSurgeryView> {
  final SurgeryFormManager _formManager = SurgeryFormManager();

  @override
  void initState() {
    super.initState();
    context
        .read<AddMedicalRecordCubit>()
        .setMedicalHistoryType(MedicalHistoryType.surgery.index);
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
        procedureName: _formManager.procedureNameController.value,
        doctorName: _formManager
            .surgeonNameController.value, // Using doctorName field for surgeon
        clinicName: _formManager.clinicNameController.value,
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
            const CustomScreenAppBar(title: 'Surgery'),
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
                          title: 'Surgery Date',
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
                          title: 'Procedure Name',
                          hintText: 'Type Here..',
                          controller:
                              _formManager.procedureNameController.controller,
                          textInputAction: TextInputAction.next,
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          title: 'Surgeon Name',
                          hintText: 'Type Here..',
                          controller:
                              _formManager.surgeonNameController.controller,
                          textInputAction: TextInputAction.next,
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          title: 'Clinic/ Hospital Name',
                          hintText: 'Type Here..',
                          controller:
                              _formManager.clinicNameController.controller,
                          textInputAction: TextInputAction.next,
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          title: 'Notes',
                          hintText: 'Type here any notes..',
                          maxLines: 7,
                          controller: _formManager.notesController.controller,
                          textInputAction: TextInputAction.next,
                        ),
                        verticalSpace(16),
                        const UploadAReportWidget(),
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
                        const AddRecordBlocListener(title: 'Surgery'),
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
