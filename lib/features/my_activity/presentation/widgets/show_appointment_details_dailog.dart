import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/my_activity/presentation/widgets/show_clinic_details_dailog.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../appointment/presentation/widgets/clinc_container.dart';
import '../../../appointment/presentation/widgets/fees_location_experience_widgets.dart';

Future<dynamic> showAppointmentDetailsDailog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.all(16.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Appointment Details',
                    style: AppTextStyles.fontTextInput(
                      color: ColorsManager.grey700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                        color: ColorsManager.grey400,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        color: ColorsManager.darkGreyText,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(16),
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Assets.images.doctor.image(
                    height: 300.h,
                    width: 300.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              verticalSpace(16),
              Text(
                'Dr. Omar Salama',
                style: AppTextStyles.fontTextInput(
                  color: ColorsManager.darkerGreyText,
                ),
              ),
              verticalSpace(8),
              Text(
                'Consultant of dermatology',
                style: AppTextStyles.fontParagraphText(
                  color: ColorsManager.darkGreyText,
                ),
              ),
              verticalSpace(16),
              const ClincContainer(),
              verticalSpace(16),
              const FeesAndLocationAndExperienceWidgets(hasExperience: false),
              verticalSpace(16),
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 8.h),
                decoration: BoxDecoration(
                  color: ColorsManager.dimmedBackground,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  spacing: 8.w,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today 4:00 PM',
                      style: AppTextStyles.fontTextInput(
                        color: ColorsManager.darkGreyText,
                      ),
                    ),
                    CustomButton(
                      width: 100.w,
                      title: 'Cancel',
                      backgroundColor: ColorsManager.dimmedBackground,
                      border: Border.all(color: ColorsManager.alertColor),
                      textStyle: AppTextStyles.fontParagraphText(
                        color: ColorsManager.alertColor,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              verticalSpace(16),
              Row(
                spacing: 8.w,
                children: [
                  Expanded(
                    child: CustomButton(
                      title: 'Clinic Details',
                      backgroundColor: ColorsManager.blue10,
                      border: Border.all(color: ColorsManager.blue40),
                      textColor: ColorsManager.primaryColor,
                      onTap: () => showClinicDetailsDialog(context),
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      title: 'Location',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
