import '../../../../core/presentation/form/form_manager.dart';
import '../../../../core/presentation/form/form_field_controller.dart';

class XRayFormManager extends BaseFormManager {
  final FormFieldController _dateController = FormFieldController();
  final FormFieldController _specialityController = FormFieldController();
  final FormFieldController _notesController = FormFieldController();
  final FormFieldController _scanTypeController = FormFieldController();
  final FormFieldController _scanNameController = FormFieldController();
  final FormFieldController _facilityNameController = FormFieldController();
  final FormFieldController _scannedPartController = FormFieldController();

  FormFieldController get dateController => _dateController;
  FormFieldController get specialityController => _specialityController;
  FormFieldController get notesController => _notesController;
  FormFieldController get scanTypeController => _scanTypeController;
  FormFieldController get scanNameController => _scanNameController;
  FormFieldController get facilityNameController => _facilityNameController;
  FormFieldController get scannedPartController => _scannedPartController;

  @override
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clearForm() {
    _dateController.clear();
    _specialityController.clear();
    _notesController.clear();
    _scanTypeController.clear();
    _scanNameController.clear();
    _facilityNameController.clear();
    _scannedPartController.clear();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _specialityController.dispose();
    _notesController.dispose();
    _scanTypeController.dispose();
    _scanNameController.dispose();
    _facilityNameController.dispose();
    _scannedPartController.dispose();
  }
}
