import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    super.key,
    this.initialValue = false,
    required this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  void _toggle() {
    setState(() {
      isChecked = !isChecked;
      widget.onChanged(isChecked);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        isChecked ? ColorsManager.checkBoxColor : Colors.transparent;

    final Color borderColor =
        isChecked ? ColorsManager.checkBoxColor : ColorsManager.grey500;

    final Color iconColor = isChecked ? Colors.white : ColorsManager.grey500;

    return GestureDetector(
      onTap: _toggle,
      child: Container(
        height: 24.h,
        width: 24.w,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
            side: BorderSide(
              color: borderColor,
              width: 2.5,
            ),
          ),
        ),
        child: Center(
          child: Icon(
            Icons.check_rounded,
            size: 18.r,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
