import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/my_activity/presentation/widgets/show_clinic_details_dailog.dart';
import '../../domain/entities/get_doctors_response_entity.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class ClincContainer extends StatelessWidget {
  final ClinicEntity? clinic;

  const ClincContainer({super.key, this.clinic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showClinicDetailsDialog(context, clinic: clinic),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 16.w,
        ),
        color: ColorsManager.dimmedColor,
        child: Text(
          clinic?.name ?? 'No Clinic',
          style: AppTextStyles.fontBodyText(
            color: ColorsManager.darkerGreyText,
          ),
        ),
      ),
    );
  }
}
