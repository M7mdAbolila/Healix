import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:healix/core/theming/shadows_manager.dart';
import 'package:healix/features/appointment/domain/entities/get_doctors_response_entity.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class FeaturedDoctorItem extends StatelessWidget {
  final DoctorEntity? doctor;

  const FeaturedDoctorItem({
    super.key,
    this.doctor,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 195.w,
      child: Container(
        margin: EdgeInsets.only(right: 16.w),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: ColorsManager.lightGreyText,
                boxShadow: [
                  ShadowsManager.softerShadow(),
                ],
              ),
              child: doctor?.photoUrl != null && doctor!.photoUrl!.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: doctor!.photoUrl!,
                      height: 137.h,
                      width: 163.w,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        height: 137.h,
                        width: 163.w,
                        color: ColorsManager.lightGreyText,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Assets.svgs.doctorPlaceHolder.svg(
                        height: 137.h,
                        width: 163.w,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Assets.svgs.doctorPlaceHolder.svg(
                      height: 137.h,
                      width: 163.w,
                      fit: BoxFit.cover,
                    ),
            ),
            verticalSpace(16),
            Text(
              '${doctor?.fname ?? ''} ${doctor?.lname ?? ''}',
              style: AppTextStyles.fontTextInput(
                color: ColorsManager.darkerGreyText,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(8),
            Text(
              doctor?.professionalTitle ?? 'Medical Specialist',
              style: AppTextStyles.fontSmallerText(
                color: ColorsManager.grey700,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(8),
            Row(
              spacing: 8.w,
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.svgs.location.svg(
                  height: 24.h,
                  width: 24.w,
                ),
                Expanded(
                  child: Text(
                    doctor?.clinic?.city ?? 'Not specified',
                    style: AppTextStyles.fontSmallerText(
                      color: ColorsManager.grey700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
