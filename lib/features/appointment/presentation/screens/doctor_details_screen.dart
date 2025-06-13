import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/appointment/presentation/widgets/available_doctor_schedule_list.dart';
import 'package:healix/features/appointment/presentation/widgets/certificate_section.dart';
import 'package:healix/features/appointment/presentation/widgets/clinc_container.dart';
import 'package:healix/features/appointment/presentation/widgets/doctor_photo_and_main_info_text.dart';
import 'package:healix/features/appointment/presentation/widgets/doctor_tags_row.dart';
import 'package:healix/features/appointment/presentation/widgets/fees_location_experience_widgets.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
import '../../domain/entities/get_doctors_response_entity.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, this.doctor});
  final DoctorEntity? doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomScreenAppBar(title: 'Doctor Profile'),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  spacing: 16.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DoctorPhotoAndMainInfoText(
                      hasExperience: true,
                      doctor: doctor,
                    ),
                    Text(
                      doctor?.professionalTitle ?? '',
                      style: AppTextStyles.fontParagraphText(
                        color: ColorsManager.darkGreyText,
                      ),
                    ),
                    const DoctorTagsRow(),
                    ClincContainer(
                      clinic: doctor?.clinic,
                    ),
                    FeesLocationExperienceWidgets(
                      hasExperience: false,
                      fees: doctor?.clinic?.fees.toString(),
                      location: doctor?.clinic?.city,
                      experience: doctor?.yearsOfExperience?.toString(),
                    ),
                    AvailableDoctorScheduleList(doctor: doctor),
                    const CertificateSection(),
                    verticalSpace(50),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
