import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/routing/routes.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/features/appointment/presentation/widgets/doctor_photo_and_main_info_text.dart';
import '../../domain/entities/get_doctors_response_entity.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import 'clinc_container.dart';

class DoctorCardWidget extends StatelessWidget {
  final DoctorEntity doctor;

  const DoctorCardWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(Routes.doctorDetailsScreen, arguments: doctor),
      child: Container(
        padding: EdgeInsets.all(16.r),
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: ColorsManager.lightGreyText),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorPhotoAndMainInfoText(doctor: doctor),
            verticalSpace(16),
            ClincContainer(clinic: doctor.clinic),
            verticalSpace(16),
            // const FeesLocationExperienceWidgets(),
            verticalSpace(16),
            _buildAvailabilityAndBookButtonContainer(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailabilityAndBookButtonContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 8.h),
      decoration: BoxDecoration(
        color: ColorsManager.dimmedBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Text(
            'Availability: ',
            style: AppTextStyles.fontParagraphText(
              color: ColorsManager.darkGreyText,
            ),
          ),
          Text(
            'Today 6:10 PM',
            style: AppTextStyles.fontTextInput(
              color: ColorsManager.darkGreyText,
            ),
          ),
          const Spacer(),
          CustomButton(
            width: 66.w,
            title: 'Book',
            textStyle: AppTextStyles.fontParagraphText(
              color: Colors.white,
            ),
            onTap: () => context.pushNamed(Routes.doctorDetailsScreen),
          ),
        ],
      ),
    );
  }
}
