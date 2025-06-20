import 'package:flutter/material.dart';
import 'form_field_controller.dart';

abstract class BaseFormManager {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validateForm();
  void clearForm();
  void dispose();
}

class LoginFormManager extends BaseFormManager {
  final FormFieldController _emailController = FormFieldController();
  final FormFieldController _passwordController = FormFieldController();

  FormFieldController get emailController => _emailController;
  FormFieldController get passwordController => _passwordController;

  @override
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clearForm() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }
}

class SignUpFormManager extends BaseFormManager {
  final FormFieldController _emailController = FormFieldController();
  final FormFieldController _passwordController = FormFieldController();
  final FormFieldController _confirmPasswordController = FormFieldController();

  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  FormFieldController get emailController => _emailController;
  FormFieldController get passwordController => _passwordController;
  FormFieldController get confirmPasswordController =>
      _confirmPasswordController;

  bool validateEmailForm() {
    return emailFormKey.currentState?.validate() ?? false;
  }

  @override
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clearForm() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }
}

class CreateProfileFormManager extends BaseFormManager {
  final FormFieldController _fullNameController = FormFieldController();
  final FormFieldController _phoneNumberController = FormFieldController();
  final FormFieldController _nationalIdController = FormFieldController();

  FormFieldController get fullNameController => _fullNameController;
  FormFieldController get phoneNumberController => _phoneNumberController;
  FormFieldController get nationalIdController => _nationalIdController;

  @override
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clearForm() {
    _fullNameController.clear();
    _phoneNumberController.clear();
    _nationalIdController.clear();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _nationalIdController.dispose();
  }
}

class PhysicalInfoFormManager extends BaseFormManager {
  final FormFieldController _heightController = FormFieldController();
  final FormFieldController _weightController = FormFieldController();
  final FormFieldController _dateOfBirthController = FormFieldController();

  FormFieldController get heightController => _heightController;
  FormFieldController get weightController => _weightController;
  FormFieldController get dateOfBirthController => _dateOfBirthController;

  @override
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clearForm() {
    _heightController.clear();
    _weightController.clear();
    _dateOfBirthController.clear();
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _dateOfBirthController.dispose();
  }
}

class ChatFormManager extends BaseFormManager {
  final FormFieldController _messageController = FormFieldController();

  FormFieldController get messageController => _messageController;

  @override
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clearForm() {
    _messageController.clear();
  }

  @override
  void dispose() {
    _messageController.dispose();
  }
}

class FamilyGroupFormManager extends BaseFormManager {
  final FormFieldController _familyNameController = FormFieldController();
  final FormFieldController _familyCodeController = FormFieldController();

  FormFieldController get familyNameController => _familyNameController;
  FormFieldController get familyCodeController => _familyCodeController;

  @override
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clearForm() {
    _familyNameController.clear();
    _familyCodeController.clear();
  }

  @override
  void dispose() {
    _familyNameController.dispose();
    _familyCodeController.dispose();
  }
}
