import 'package:flutter/material.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/widgets/custom_dropdown.dart';

import '../../../../core/helpers/enms.dart';

class ReactionSeverityDropDown extends StatelessWidget {
  final Function(int)? onChanged;

  const ReactionSeverityDropDown({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedDropdown<ReactionSeverity>(
      label: 'Reaction Severity',
      placeholder: 'Choose severity',
      items: ReactionSeverity.values,
      displayText: (item) => item.name.capitalize(),
      onSelectionChanged: (item) {
        onChanged?.call(item.index);
      },
    );
  }
}
