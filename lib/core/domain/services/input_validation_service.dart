abstract class InputValidationService {
  String? validateEmail(String? email);
  String? validatePassword(String? password);
  String? validateRequiredField(String? value, String fieldName);
}
