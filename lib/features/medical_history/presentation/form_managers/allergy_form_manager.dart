import '../../../../core/presentation/form/form_manager.dart';
import '../../../../core/presentation/form/form_field_controller.dart';

class AllergyFormManager extends BaseFormManager {
  final FormFieldController _dateController = FormFieldController();
  final FormFieldController _specialityController = FormFieldController();
  final FormFieldController _notesController = FormFieldController();
  final FormFieldController _allergenController = FormFieldController();

  FormFieldController get dateController => _dateController;
  FormFieldController get specialityController => _specialityController;
  FormFieldController get notesController => _notesController;
  FormFieldController get allergenController => _allergenController;

  int? _allergyStatus;
  int? _reactionSeverity;

  int? get allergyStatus => _allergyStatus;
  set allergyStatus(int? value) => _allergyStatus = value;

  int? get reactionSeverity => _reactionSeverity;
  set reactionSeverity(int? value) => _reactionSeverity = value;

  @override
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clearForm() {
    _dateController.clear();
    _specialityController.clear();
    _notesController.clear();
    _allergenController.clear();
    _allergyStatus = null;
    _reactionSeverity = null;
  }

  @override
  void dispose() {
    _dateController.dispose();
    _specialityController.dispose();
    _notesController.dispose();
    _allergenController.dispose();
  }
}
