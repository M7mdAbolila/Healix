import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/features/home/presentation/widgets/doctor_rate_card.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class FeaturedDoctorItem extends StatelessWidget {
  const FeaturedDoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Assets.images.doctor.image(
                  height: 137.h,
                  width: 163.w,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 8.w,
                top: 8.h,
                child: const DoctorRateCard(),
              ),
            ],
          ),
          verticalSpace(16),
          Text(
            'Dr. Amr El Shamy',
            style: AppTextStyles.fontTextInput(
              color: ColorsManager.darkerGreyText,
            ),
          ),
          verticalSpace(8),
          Text(
            'Specialist of implantology',
            style: AppTextStyles.fontSmallerText(
              color: ColorsManager.grey700,
            ),
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
              Text(
                'Heliopolis',
                style: AppTextStyles.fontSmallerText(
                  color: ColorsManager.grey700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
