import 'package:flutter/material.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/widgets/custom_dropdown.dart';

import '../../../../core/helpers/enms.dart';

class RiskLevelDropDown extends StatelessWidget {
  final Function(int?)? onRiskLevelChanged;
  final int? initialValue;

  const RiskLevelDropDown({
    super.key,
    this.onRiskLevelChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedDropdown<RiskLevel>(
      label: 'Risk Level',
      placeholder: 'Choose Risk Level',
      items: RiskLevel.values,
      initialValue:
          initialValue != null ? RiskLevel.values[initialValue!] : null,
      displayText: (item) => item.name.capitalize(),
      onSelectionChanged: (item) {
        onRiskLevelChanged?.call(item.index);
      },
    );
  }
}
