import '../../../../core/presentation/form/form_manager.dart';
import '../../../../core/presentation/form/form_field_controller.dart';

class MedicalVisitFormManager extends BaseFormManager {
  final FormFieldController _dateController = FormFieldController();
  final FormFieldController _specialityController = FormFieldController();
  final FormFieldController _notesController = FormFieldController();
  final FormFieldController _doctorNameController = FormFieldController();
  final FormFieldController _clinicNameController = FormFieldController();
  final FormFieldController _medicalDiagnosesController = FormFieldController();

  FormFieldController get dateController => _dateController;
  FormFieldController get specialityController => _specialityController;
  FormFieldController get notesController => _notesController;
  FormFieldController get doctorNameController => _doctorNameController;
  FormFieldController get clinicNameController => _clinicNameController;
  FormFieldController get medicalDiagnosesController =>
      _medicalDiagnosesController;

  bool? _isFirstTime;
  bool? get isFirstTime => _isFirstTime;
  set isFirstTime(bool? value) => _isFirstTime = value;

  @override
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clearForm() {
    _dateController.clear();
    _specialityController.clear();
    _notesController.clear();
    _doctorNameController.clear();
    _clinicNameController.clear();
    _medicalDiagnosesController.clear();
    _isFirstTime = null;
  }

  @override
  void dispose() {
    _dateController.dispose();
    _specialityController.dispose();
    _notesController.dispose();
    _doctorNameController.dispose();
    _clinicNameController.dispose();
    _medicalDiagnosesController.dispose();
  }
}
