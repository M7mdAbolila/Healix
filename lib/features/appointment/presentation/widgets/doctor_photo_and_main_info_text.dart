import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class DoctorPhotoAndMainInfoText extends StatelessWidget {
  const DoctorPhotoAndMainInfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Assets.images.doctor.image(
            height: 80.h,
            width: 80.w,
          ),
        ),
        Expanded(
          child: Column(
            spacing: 5.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Omar Salama',
                style: AppTextStyles.fontTextInput(
                  color: ColorsManager.darkerGreyText,
                ),
              ),
              Text(
                'Consultant of dermatology',
                style: AppTextStyles.fontParagraphText(
                  color: ColorsManager.darkGreyText,
                ),
              ),
              Text(
                'Professional Title',
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
