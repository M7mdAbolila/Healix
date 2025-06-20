import '../../../../core/presentation/form/form_manager.dart';
import '../../../../core/presentation/form/form_field_controller.dart';

class BookAppointmentFormManager extends BaseFormManager {
  final FormFieldController _doctorIdController = FormFieldController();
  final FormFieldController _dayController = FormFieldController();
  final FormFieldController _fromTimeController = FormFieldController();
  final FormFieldController _toTimeController = FormFieldController();

  FormFieldController get doctorIdController => _doctorIdController;
  FormFieldController get dayController => _dayController;
  FormFieldController get fromTimeController => _fromTimeController;
  FormFieldController get toTimeController => _toTimeController;

  @override
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clearForm() {
    _doctorIdController.clear();
    _dayController.clear();
    _fromTimeController.clear();
    _toTimeController.clear();
  }

  @override
  void dispose() {
    _doctorIdController.dispose();
    _dayController.dispose();
    _fromTimeController.dispose();
    _toTimeController.dispose();
  }
}

class DoctorSearchFormManager extends BaseFormManager {
  final FormFieldController _searchController = FormFieldController();
  final FormFieldController _specialtyController = FormFieldController();
  final FormFieldController _locationController = FormFieldController();

  FormFieldController get searchController => _searchController;
  FormFieldController get specialtyController => _specialtyController;
  FormFieldController get locationController => _locationController;

  @override
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clearForm() {
    _searchController.clear();
    _specialtyController.clear();
    _locationController.clear();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _specialtyController.dispose();
    _locationController.dispose();
  }
}
