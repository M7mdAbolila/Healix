import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class AppointmentStatusWidget extends StatelessWidget {
  const AppointmentStatusWidget({super.key, required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        status == 'Completed'
            ? Assets.svgs.completed.svg(height: 24.h, width: 24.w)
            : Assets.svgs.cancelled.svg(height: 24.h, width: 24.w),
        Text(
          status,
          style: AppTextStyles.fontBodyText(
            color: status == 'Completed'
                ? ColorsManager.supportColor
                : ColorsManager.alertColor,
          ),
        ),
      ],
    );
  }
}
