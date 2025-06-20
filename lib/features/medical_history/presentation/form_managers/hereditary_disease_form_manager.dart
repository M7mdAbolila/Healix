import '../../../../core/presentation/form/form_manager.dart';
import '../../../../core/presentation/form/form_field_controller.dart';

class HereditaryDiseaseFormManager extends BaseFormManager {
  final FormFieldController _dateController = FormFieldController();
  final FormFieldController _specialityController = FormFieldController();
  final FormFieldController _notesController = FormFieldController();
  final FormFieldController _diseaseNameController = FormFieldController();
  final FormFieldController _familyInfectionSpreadLevelController =
      FormFieldController();
  final FormFieldController _lastTimeDiagnosedController =
      FormFieldController();

  FormFieldController get dateController => _dateController;
  FormFieldController get specialityController => _specialityController;
  FormFieldController get notesController => _notesController;
  FormFieldController get diseaseNameController => _diseaseNameController;
  FormFieldController get familyInfectionSpreadLevelController =>
      _familyInfectionSpreadLevelController;
  FormFieldController get lastTimeDiagnosedController =>
      _lastTimeDiagnosedController;

  int? _riskLevel;
  int? get riskLevel => _riskLevel;
  set riskLevel(int? value) => _riskLevel = value;

  @override
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clearForm() {
    _dateController.clear();
    _specialityController.clear();
    _notesController.clear();
    _diseaseNameController.clear();
    _familyInfectionSpreadLevelController.clear();
    _lastTimeDiagnosedController.clear();
    _riskLevel = null;
  }

  @override
  void dispose() {
    _dateController.dispose();
    _specialityController.dispose();
    _notesController.dispose();
    _diseaseNameController.dispose();
    _familyInfectionSpreadLevelController.dispose();
    _lastTimeDiagnosedController.dispose();
  }
}
