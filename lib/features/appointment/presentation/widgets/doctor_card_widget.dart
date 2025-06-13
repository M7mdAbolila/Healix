import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/routing/routes.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/features/appointment/presentation/widgets/doctor_photo_and_main_info_text.dart';
import '../../domain/entities/get_doctors_response_entity.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import 'clinc_container.dart';
import 'fees_location_experience_widgets.dart';

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
            FeesLocationExperienceWidgets(
              fees: doctor.clinic?.fees.toString(),
              location: doctor.clinic?.city,
              experience: doctor.yearsOfExperience?.toString(),
            ),
            verticalSpace(16),
            CustomButton(
              title: 'Book',
              onTap: () => context.pushNamed(
                Routes.doctorDetailsScreen,
                arguments: doctor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
