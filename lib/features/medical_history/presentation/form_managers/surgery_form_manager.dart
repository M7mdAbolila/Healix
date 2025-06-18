import '../../../../core/presentation/form/form_manager.dart';
import '../../../../core/presentation/form/form_field_controller.dart';

class SurgeryFormManager extends BaseFormManager {
  final FormFieldController _dateController = FormFieldController();
  final FormFieldController _specialityController = FormFieldController();
  final FormFieldController _notesController = FormFieldController();
  final FormFieldController _procedureNameController = FormFieldController();
  final FormFieldController _surgeonNameController = FormFieldController();
  final FormFieldController _clinicNameController = FormFieldController();

  FormFieldController get dateController => _dateController;
  FormFieldController get specialityController => _specialityController;
  FormFieldController get notesController => _notesController;
  FormFieldController get procedureNameController => _procedureNameController;
  FormFieldController get surgeonNameController => _surgeonNameController;
  FormFieldController get clinicNameController => _clinicNameController;

  @override
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clearForm() {
    _dateController.clear();
    _specialityController.clear();
    _notesController.clear();
    _procedureNameController.clear();
    _surgeonNameController.clear();
    _clinicNameController.clear();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _specialityController.dispose();
    _notesController.dispose();
    _procedureNameController.dispose();
    _surgeonNameController.dispose();
    _clinicNameController.dispose();
  }
}
