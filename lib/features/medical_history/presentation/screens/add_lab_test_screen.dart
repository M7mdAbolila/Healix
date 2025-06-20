import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/di/setup_get_it.dart';
import 'package:healix/features/medical_history/presentation/widgets/upload_report_widget.dart';

import '../../../../core/helpers/enms.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_date_picker_widget.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../domain/entities/history_record_entity.dart';
import '../form_managers/lab_test_form_manager.dart';
import '../state_management/add_medical_record_cubit/add_medical_record_cubit.dart';
import '../widgets/add_record_bloc_lisneter.dart';

class AddLabTestScreen extends StatelessWidget {
  const AddLabTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddMedicalRecordCubit>(),
      child: const _AddLabTestView(),
    );
  }
}

class _AddLabTestView extends StatefulWidget {
  const _AddLabTestView();

  @override
  State<_AddLabTestView> createState() => _AddLabTestViewState();
}

class _AddLabTestViewState extends State<_AddLabTestView> {
  final LabTestFormManager _formManager = LabTestFormManager();

  @override
  void initState() {
    super.initState();
    context
        .read<AddMedicalRecordCubit>()
        .setMedicalHistoryType(MedicalHistoryType.lapTests.index);
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
            const CustomScreenAppBar(title: 'Lab Test'),
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
                          title: 'Test Date',
                          controller: _formManager.dateController.controller,
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          title: 'Test Type/ Name',
                          hintText: 'Type Here..',
                          controller:
                              _formManager.testNameController.controller,
                          textInputAction: TextInputAction.next,
                          validator: (value) => context
                              .read<AddMedicalRecordCubit>()
                              .validateRequiredField(value, 'Test name'),
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
                          title: 'Notes',
                          hintText: 'Type Here..',
                          controller: _formManager.notesController.controller,
                          textInputAction: TextInputAction.done,
                          maxLines: 3,
                        ),
                        verticalSpace(16),
                        const UploadAReportWidget(),
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
                        const AddRecordBlocListener(title: 'Lab Test'),
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
        testName: _formManager.testNameController.value,
        speciality: _formManager.specialityController.value,
        notes: _formManager.notesController.value,
      );

      context.read<AddMedicalRecordCubit>().addMedicalRecord(record);
    }
  }
}
