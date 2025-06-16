import 'package:flutter/material.dart';

class FormFieldController {
  final TextEditingController _controller = TextEditingController();
  String? _errorMessage;

  TextEditingController get controller => _controller;
  String? get errorMessage => _errorMessage;
  String get value => _controller.text.trim();
  bool get hasError => _errorMessage != null;
  bool get isEmpty => _controller.text.trim().isEmpty;

  void setError(String? error) {
    _errorMessage = error;
  }

  void clearError() {
    _errorMessage = null;
  }

  void clear() {
    _controller.clear();
    clearError();
  }

  void dispose() {
    _controller.dispose();
  }
}
