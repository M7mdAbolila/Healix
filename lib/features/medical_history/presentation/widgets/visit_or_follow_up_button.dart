import 'package:flutter/material.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import '../form_managers/medical_visit_form_manager.dart';

class VisitOrFollowUpButton extends StatefulWidget {
  final MedicalVisitFormManager formManager;

  const VisitOrFollowUpButton({
    super.key,
    required this.formManager,
  });

  @override
  State<VisitOrFollowUpButton> createState() => _VisitOrFollowUpButtonState();
}

class _VisitOrFollowUpButtonState extends State<VisitOrFollowUpButton> {
  String _selectedOption = 'First Visit';

  @override
  void initState() {
    super.initState();
    // Initialize with first time = true
    widget.formManager.isFirstTime = true;
  }

  void _updateSelection(String value) {
    setState(() {
      _selectedOption = value;
      widget.formManager.isFirstTime = (value == 'First Visit');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(flex: 1),
        Radio<String>(
          value: 'First Visit',
          groupValue: _selectedOption,
          onChanged: (value) {
            if (value != null) {
              _updateSelection(value);
            }
          },
          activeColor: ColorsManager.primaryColor,
        ),
        Text(
          'First Visit',
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        const Spacer(flex: 2),
        Radio<String>(
          value: 'Follow-up',
          groupValue: _selectedOption,
          onChanged: (value) {
            if (value != null) {
              _updateSelection(value);
            }
          },
          activeColor: ColorsManager.primaryColor,
        ),
        Text(
          'Follow-up',
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
