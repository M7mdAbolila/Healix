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
import '../form_managers/health_log_form_manager.dart';
import '../state_management/add_medical_record_cubit/add_medical_record_cubit.dart';
import '../widgets/upload_report_widget.dart';
import '../widgets/add_record_bloc_lisneter.dart';

class AddLogsScreen extends StatelessWidget {
  const AddLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddMedicalRecordCubit>(),
      child: const _AddLogsView(),
    );
  }
}

class _AddLogsView extends StatefulWidget {
  const _AddLogsView();

  @override
  State<_AddLogsView> createState() => _AddLogsViewState();
}

class _AddLogsViewState extends State<_AddLogsView> {
  final HealthLogFormManager _formManager = HealthLogFormManager();

  @override
  void initState() {
    super.initState();
    context
        .read<AddMedicalRecordCubit>()
        .setMedicalHistoryType(MedicalHistoryType.logs.index);
  }

  @override
  void dispose() {
    _formManager.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formManager.validateForm()) {
      // Combine logType and logValue into notes field
      final notesContent = [
        if (_formManager.notesController.value.isNotEmpty)
          _formManager.notesController.value,
        if (_formManager.logValueController.value.isNotEmpty)
          'Value: ${_formManager.logValueController.value}',
      ].join('\n');

      final record = HistoryRecordEntity(
        date: DateTime.tryParse(_formManager.dateController.value),
        speciality: _formManager.specialityController.value,
        logType: _formManager.logTypeController.value,
        notes: notesContent.isNotEmpty ? notesContent : null,
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
            const CustomScreenAppBar(title: 'Logs'),
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
                          title: 'Log Date',
                          controller: _formManager.dateController.controller,
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          title: 'Log Type',
                          hintText: 'Type Here..',
                          controller: _formManager.logTypeController.controller,
                          textInputAction: TextInputAction.next,
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
                          title: 'Value',
                          hintText: 'Type Here..',
                          controller:
                              _formManager.logValueController.controller,
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
                        const AddRecordBlocListener(title: 'Logs'),
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
