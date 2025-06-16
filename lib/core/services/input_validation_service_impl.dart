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
}
