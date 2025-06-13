import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/shadows_manager.dart';
import '../../domain/entities/get_doctors_response_entity.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class DoctorPhotoAndMainInfoText extends StatelessWidget {
  final DoctorEntity? doctor;
  final bool hasExperience;

  const DoctorPhotoAndMainInfoText({
    super.key,
    this.hasExperience = false,
    this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        Container(
          height: 80.h,
          width: 80.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: ColorsManager.lightGreyText,
            boxShadow: [
              ShadowsManager.softerShadow(),
            ],
          ),
          child: doctor?.photoUrl != null
              ? CachedNetworkImage(
                  imageUrl: doctor!.photoUrl!,
                  height: 80.h,
                  width: 80.w,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    size: 20.sp,
                    color: ColorsManager.darkGreyText,
                  ),
                )
              : Assets.svgs.consultDoc.svg(
                  height: 80.h,
                  width: 80.w,
                ),
        ),
        Expanded(
          child: Column(
            spacing: 5.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Dr. ${doctor?.fname ?? ''} ${doctor?.lname ?? ''}',
                style: AppTextStyles.fontTextInput(
                  color: ColorsManager.darkerGreyText,
                ),
              ),
              hasExperience
                  ? Text(
                      'Experience: ${doctor?.yearsOfExperience ?? 'X'} Years',
                      style: AppTextStyles.fontParagraphText(
                        color: ColorsManager.primaryColor,
                      ),
                    )
                  : Text(
                      doctor?.professionalTitle ?? 'Consultant of dermatology',
                      style: AppTextStyles.fontParagraphText(
                        color: ColorsManager.darkGreyText,
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
