import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/features/my_activity/presentation/widgets/appointment_status_widget.dart';
import 'package:healix/features/my_activity/presentation/widgets/show_appointment_details_dailog.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../appointment/presentation/widgets/clinc_container.dart';
import '../../../appointment/presentation/widgets/doctor_photo_and_main_info_text.dart';
import '../../../appointment/presentation/widgets/fees_location_experience_widgets.dart';

class ActivityAppointmentCard extends StatelessWidget {
  const ActivityAppointmentCard({super.key, this.status});
  final String? status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorsManager.lightGreyText),
      ),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DoctorPhotoAndMainInfoText(),
          const ClincContainer(),
          status.isNullOrEmpty()
              ? const FeesLocationExperienceWidgets()
              : AppointmentStatusWidget(
                  status: status!,
                ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 8.h),
            decoration: BoxDecoration(
              color: ColorsManager.dimmedColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today 4:00 PM',
                  style: AppTextStyles.fontTextInput(
                    color: ColorsManager.darkGreyText,
                  ),
                ),
                CustomButton(
                  title: 'Details',
                  width: 80.w,
                  textStyle:
                      AppTextStyles.fontParagraphText(color: Colors.white),
                  onTap: () => showAppointmentDetailsDailog(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
