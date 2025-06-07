import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/logging.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/shadows_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:intl/intl.dart';

import '../dialogs/custom_date_picker_dialog.dart';
import '../helpers/spacing.dart';

class CustomDatePickerWidget extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool showIcon;
  const CustomDatePickerWidget({
    super.key,
    required this.title,
    required this.controller,
    this.showIcon = true,
  });

  @override
  State<CustomDatePickerWidget> createState() => _CustomDatePickerWidgetState();
}

class _CustomDatePickerWidgetState extends State<CustomDatePickerWidget> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.controller.text.isNotEmpty) {
      try {
        _selectedDate = DateFormat('dd/MM/yyyy').parse(widget.controller.text);
      } catch (_) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkGreyText,
          ),
        ),
        verticalSpace(8),
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showCustomDatePickerDialog(context);
            if (pickedDate != null) {
              setState(() {
                _selectedDate = pickedDate;
                widget.controller.text =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                Logging.info('Selected date: ${widget.controller.text}');
              });
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                ShadowsManager.softerShadow(),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDate == null
                      ? 'DD/MM/YYYY'
                      : DateFormat('dd/MM/yyyy').format(_selectedDate!),
                  style: AppTextStyles.fontTextInput(
                    color: _selectedDate == null
                        ? ColorsManager.lightGreyText
                        : ColorsManager.darkGreyText,
                  ),
                ),
                if (widget.showIcon)
                  Container(
                    padding: EdgeInsets.all(2.r),
                    decoration: BoxDecoration(
                      color: ColorsManager.lightGreyText,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 20.sp,
                      color: ColorsManager.darkGreyText,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
