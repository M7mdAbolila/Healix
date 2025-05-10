import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import 'clinc_container.dart';
import 'fees_Location_experience_widgets.dart';

Future<dynamic> showConfirmBookingDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.all(32.r),
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
                    'Confirm Booking',
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
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Assets.images.doctor.image(
                  height: 300.h,
                  width: 300.w,
                  fit: BoxFit.cover,
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
              const FeesLocationExperienceWidgets(hasExperience: false),
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
                      width: 120.w,
                      title: 'Confirm Book',
                      textStyle: AppTextStyles.fontParagraphText(
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
