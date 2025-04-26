import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';

import '../theming/colors_manager.dart';
import '../theming/text_styles.dart';

class CustomLinearProgress extends StatefulWidget {
  const CustomLinearProgress({
    super.key,
    required this.value,
  });
  final double value;
  @override
  State<CustomLinearProgress> createState() => _CustomLinearProgressState();
}

class _CustomLinearProgressState extends State<CustomLinearProgress> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: Column(
        children: [
          LinearProgressIndicator(
            value: widget.value,
            minHeight: 8.h,
            borderRadius: BorderRadius.circular(20.r),
            color: widget.value == 1
                ? ColorsManager.supportColor
                : ColorsManager.primaryColor,
            backgroundColor: ColorsManager.primaryLighter,
          ),
          Row(
            mainAxisAlignment: widget.value == 1
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              horizontalSpace(
                  widget.value == 1 ? 0 : (widget.value * 200) - 10),
              Text(
                '${(widget.value * 100).toInt()}%',
                style: AppTextStyles.fontSmallerText(
                    color: widget.value == 1
                        ? ColorsManager.supportColor
                        : ColorsManager.primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
