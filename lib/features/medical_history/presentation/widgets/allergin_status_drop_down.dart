import 'package:flutter/material.dart';
import 'package:healix/core/helpers/extensions.dart';

import '../../../../core/helpers/enms.dart';
import '../../../../core/widgets/custom_dropdown.dart';

class AllergyStatusDropDown extends StatelessWidget {
  final Function(int)? onChanged;

  const AllergyStatusDropDown({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedDropdown<AllergyStatus>(
      label: 'Allergy Status',
      placeholder: 'Choose Allergy status',
      items: AllergyStatus.values,
      displayText: (item) => item.name.capitalize(),
      onSelectionChanged: (item) {
        onChanged?.call(item.index);
      },
    );
  }
}
