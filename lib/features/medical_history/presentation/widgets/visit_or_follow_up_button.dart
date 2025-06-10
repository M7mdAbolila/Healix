import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/features/medical_history/presentation/logic/medical_history_cubit/medical_history_cubit.dart';

import '../../../../core/theming/colors_manager.dart';

class VisitOrFollowUpButton extends StatefulWidget {
  const VisitOrFollowUpButton({super.key});

  @override
  State<VisitOrFollowUpButton> createState() => _VisitOrFollowUpButtonState();
}

class _VisitOrFollowUpButtonState extends State<VisitOrFollowUpButton> {
  String _selectedOption = 'First Visit';

  @override
  void initState() {
    super.initState();
    context.read<MedicalHistoryCubit>().isFirstTime = true;
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
            setState(() {
              _selectedOption = value!;
              context.read<MedicalHistoryCubit>().isFirstTime = true;
            });
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
            setState(() {
              _selectedOption = value!;
              context.read<MedicalHistoryCubit>().isFirstTime = false;
            });
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
