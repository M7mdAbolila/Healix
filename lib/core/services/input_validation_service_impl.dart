import '../domain/services/input_validation_service.dart';
import '../helpers/app_regex.dart';
import '../helpers/extensions.dart';

class InputValidationServiceImpl implements InputValidationService {
  @override
  String? validateEmail(String? email) {
    final String? trimmedEmail = email?.trim();

    if (trimmedEmail.isNullOrEmpty()) {
      return 'Email is required';
    }

    if (!AppRegex.isEmailValid(trimmedEmail!)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  @override
  String? validatePassword(String? password) {
    if (password.isNullOrEmpty()) {
      return 'Password is required';
    }

    if (!AppRegex.isPasswordValid(password!)) {
      return 'Use at least 8 characters with a mix of uppercase, lowercase, numbers, and special symbols.';
    }

    return null;
  }

  @override
  String? validateRequiredField(String? value, String fieldName) {
    final String? trimmedValue = value?.trim();

    if (trimmedValue.isNullOrEmpty()) {
      return '$fieldName is required';
    }

    return null;
  }

  @override
  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword.isNullOrEmpty()) {
      return 'Please confirm your password';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match';
    }

    return null;
  }

  @override
  String? validateFullName(String? fullName) {
    final String? trimmedName = fullName?.trim();

    if (trimmedName.isNullOrEmpty()) {
      return 'Full name is required';
    }

    if (trimmedName!.length < 2) {
      return 'Full name must be at least 2 characters';
    }

    return null;
  }

  @override
  String? validatePhoneNumber(String? phoneNumber) {
    final String? trimmedPhone = phoneNumber?.trim();

    if (trimmedPhone.isNullOrEmpty()) {
      return 'Phone number is required';
    }

    if (!AppRegex.isPhoneNumberValid(trimmedPhone!)) {
      return 'Enter a valid phone number';
    }

    return null;
  }

  @override
  String? validateNationalId(String? nationalId) {
    final String? trimmedId = nationalId?.trim();

    if (trimmedId.isNullOrEmpty()) {
      return 'National ID is required';
    }

    if (!AppRegex.isEgyptianNationalIdValid(trimmedId!)) {
      return 'Enter a valid National ID';
    }

    return null;
  }

  @override
  String? validateNumericField(String? value, String fieldName) {
    final String? trimmedValue = value?.trim();

    if (trimmedValue.isNullOrEmpty()) {
      return '$fieldName is required';
    }

    final numericValue = double.tryParse(trimmedValue!);
    if (numericValue == null || numericValue <= 0) {
      return 'Enter a valid $fieldName';
    }

    return null;
  }
}
