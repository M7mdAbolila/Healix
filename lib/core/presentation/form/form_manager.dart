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
