import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/appointment/presentation/widgets/available_slots_list.dart';
import 'package:healix/features/appointment/presentation/widgets/certificate_section.dart';
import 'package:healix/features/appointment/presentation/widgets/clinc_container.dart';
import 'package:healix/features/appointment/presentation/widgets/doctor_photo_and_main_info_text.dart';
import 'package:healix/features/appointment/presentation/widgets/doctor_tags_row.dart';
import 'package:healix/features/appointment/presentation/widgets/fees_location_experience_widgets.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
import '../widgets/about_doctor_section.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

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
                    const DoctorPhotoAndMainInfoText(hasExperience: true),
                    Text(
                      'Consultant of dermatology',
                      style: AppTextStyles.fontParagraphText(
                        color: ColorsManager.darkGreyText,
                      ),
                    ),
                    const DoctorTagsRow(),
                    const ClincContainer(),
                    const FeesAndLocationAndExperienceWidgets(
                        hasExperience: false),
                    const AvailableSlotsList(),
                    const AboutDoctorSection(),
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
