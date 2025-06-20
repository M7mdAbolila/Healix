import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/di/setup_get_it.dart';
import 'package:healix/features/medical_history/presentation/widgets/allergin_status_drop_down.dart';
import 'package:healix/features/medical_history/presentation/widgets/reaction_severity_drop_down.dart';

import '../../../../core/helpers/enms.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_date_picker_widget.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../domain/entities/history_record_entity.dart';
import '../form_managers/allergy_form_manager.dart';
import '../state_management/add_medical_record_cubit/add_medical_record_cubit.dart';
import '../widgets/add_record_bloc_lisneter.dart';

class AddAllergyScreen extends StatelessWidget {
  const AddAllergyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddMedicalRecordCubit>(),
      child: const _AddAllergyView(),
    );
  }
}

class _AddAllergyView extends StatefulWidget {
  const _AddAllergyView();

  @override
  State<_AddAllergyView> createState() => _AddAllergyViewState();
}

class _AddAllergyViewState extends State<_AddAllergyView> {
  final AllergyFormManager _formManager = AllergyFormManager();

  @override
  void initState() {
    super.initState();
    context
        .read<AddMedicalRecordCubit>()
        .setMedicalHistoryType(MedicalHistoryType.allergy.index);
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
        body: BlocListener<AddMedicalRecordCubit, AddMedicalRecordState>(
          listener: (context, state) {
            if (state is AddMedicalRecordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Allergy record added successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.of(context).pop();
            } else if (state is AddMedicalRecordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Column(
            children: [
              const CustomScreenAppBar(title: 'Allergy'),
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
                            title: 'Date Of Onset',
                            controller: _formManager.dateController.controller,
                          ),
                          verticalSpace(16),
                          CustomTextFormField(
                            title: 'Allergen',
                            hintText: 'e.g., Penicillin, Pollen, Food',
                            controller:
                                _formManager.allergenController.controller,
                            textInputAction: TextInputAction.next,
                            validator: (value) => context
                                .read<AddMedicalRecordCubit>()
                                .validateRequiredField(value, 'Allergen'),
                          ),
                          verticalSpace(16),
                          const ReactionSeverityDropDown(),
                          verticalSpace(16),
                          const AllergyStatusDropDown(),
                          verticalSpace(16),
                          CustomTextFormField(
                            title: 'Notes',
                            hintText: 'Type Here..',
                            controller: _formManager.notesController.controller,
                            textInputAction: TextInputAction.done,
                            maxLines: 3,
                          ),
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
                          const AddRecordBlocListener(title: 'Allergy'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formManager.validateForm()) {
      final record = HistoryRecordEntity(
        date: DateTime.tryParse(_formManager.dateController.value),
        allergen: _formManager.allergenController.value,
        allergyStatus: _formManager.allergyStatus,
        reactionSeverity: _formManager.reactionSeverity,
        notes: _formManager.notesController.value,
      );

      context.read<AddMedicalRecordCubit>().addMedicalRecord(record);
    }
  }
}
