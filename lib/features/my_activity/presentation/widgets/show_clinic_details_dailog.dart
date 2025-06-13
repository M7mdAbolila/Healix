import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/my_activity/presentation/widgets/clinic_hotline_and_location.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../appointment/domain/entities/get_doctors_response_entity.dart';

Future<dynamic> showClinicDetailsDialog(BuildContext context,
    {ClinicEntity? clinic}) {
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
                    'Clinic Details',
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
                  child: clinic?.photoUrl != null
                      ? CachedNetworkImage(
                          height: 300.h,
                          width: 300.w,
                          fit: BoxFit.cover,
                          imageUrl: clinic!.photoUrl!,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            size: 20.sp,
                            color: ColorsManager.darkGreyText,
                          ),
                        )
                      : Assets.images.clinicPic.image(
                          height: 300.h,
                          width: 300.w,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              verticalSpace(16),
              Text(
                clinic?.name ?? 'Clinic Name',
                style: AppTextStyles.fontTextInput(
                  color: ColorsManager.darkerGreyText,
                ),
              ),
              verticalSpace(16),
              ClinicHotlineAndLocation(
                hotline: clinic?.hotline,
                location: clinic?.city,
              ),
              verticalSpace(16),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              //   decoration: BoxDecoration(
              //     color: ColorsManager.dimmedBackground,
              //     borderRadius: BorderRadius.circular(8.r),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         'Working Hours: ',
              //         style: AppTextStyles.fontParagraphText(
              //           color: ColorsManager.darkGreyText,
              //         ),
              //       ),
              //       Text(
              //         '19:00 AM - 11:00 AM',
              //         style: AppTextStyles.fontBodyText(
              //           color: ColorsManager.darkGreyText,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // verticalSpace(16),
              // Row(
              //   spacing: 8.w,
              //   children: [
              //     Expanded(
              //       child: CustomButton(
              //         title: 'Back',
              //         backgroundColor: ColorsManager.blue10,
              //         border: Border.all(color: ColorsManager.blue40),
              //         textColor: ColorsManager.primaryColor,
              //         onTap: () => context.pop(),
              //       ),
              //     ),
              //     Expanded(
              //       child: CustomButton(
              //         title: 'Location',
              //         onTap: () {},
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      );
    },
  );
}
