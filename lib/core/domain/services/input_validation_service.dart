abstract class InputValidationService {
  String? validateEmail(String? email);
  String? validatePassword(String? password);
  String? validateConfirmPassword(String? password, String? confirmPassword);
  String? validateRequiredField(String? value, String fieldName);
  String? validateFullName(String? fullName);
  String? validatePhoneNumber(String? phoneNumber);
  String? validateNationalId(String? nationalId);
  String? validateNumericField(String? value, String fieldName);
  String? validateChatMessage(String? message);
}
