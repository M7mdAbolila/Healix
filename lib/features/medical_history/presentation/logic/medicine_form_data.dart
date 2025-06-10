import 'package:flutter/material.dart';
import 'package:healix/core/helpers/logging.dart';

class MedicineFormData {
  final TextEditingController medicineNameController;
  final TextEditingController frequencyController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;

  MedicineFormData()
      : medicineNameController = TextEditingController(),
        frequencyController = TextEditingController(),
        startDateController = TextEditingController(),
        endDateController = TextEditingController();

  void dispose() {
    medicineNameController.dispose();
    frequencyController.dispose();
    startDateController.dispose();
    endDateController.dispose();
  }

  bool get isValid {
    return medicineNameController.text.isNotEmpty &&
        frequencyController.text.isNotEmpty;
  }

  void clear() {
    medicineNameController.clear();
    frequencyController.clear();
    startDateController.clear();
    endDateController.clear();
  }

  String calculateDuration() {
    if (startDateController.text.isEmpty || endDateController.text.isEmpty) {
      return '';
    }

    try {
      final startDate = DateTime.parse(startDateController.text);
      final endDate = DateTime.parse(endDateController.text);
      final difference = endDate.difference(startDate);

      if (difference.inDays > 0) {
        Logging.info(
          'Calculated duration: ${difference.inDays} days',
        );
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
