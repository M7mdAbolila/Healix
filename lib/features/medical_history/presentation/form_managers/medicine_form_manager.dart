import 'package:flutter/material.dart';

class MedicineFormManager {
  final TextEditingController _medicineNameController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  TextEditingController get medicineNameController => _medicineNameController;
  TextEditingController get frequencyController => _frequencyController;
  TextEditingController get startDateController => _startDateController;
  TextEditingController get endDateController => _endDateController;

  bool get isValid {
    return _medicineNameController.text.isNotEmpty &&
        _frequencyController.text.isNotEmpty;
  }

  void clear() {
    _medicineNameController.clear();
    _frequencyController.clear();
    _startDateController.clear();
    _endDateController.clear();
  }

  void dispose() {
    _medicineNameController.dispose();
    _frequencyController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
  }

  String calculateDuration() {
    if (_startDateController.text.isEmpty || _endDateController.text.isEmpty) {
      return '';
    }

    try {
      final startDate = DateTime.parse(_startDateController.text);
      final endDate = DateTime.parse(_endDateController.text);
      final difference = endDate.difference(startDate);

      if (difference.inDays > 0) {
        return '${difference.inDays} days';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hours';
      } else {
        return '${difference.inMinutes} minutes';
      }
    } catch (e) {
      return '';
    }
  }
}
