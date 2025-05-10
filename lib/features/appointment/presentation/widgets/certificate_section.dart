import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class CertificateSection extends StatelessWidget {
  const CertificateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Certificate',
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: ColorsManager.lightGreyText),
          ),
          child: Row(
            spacing: 16.w,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  spacing: 8.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Number of Certificates',
                      style: AppTextStyles.fontBodyText(
                        color: ColorsManager.darkerGreyText,
                      ),
                    ),
                    Text(
                      'Certificate 1, Certificate 2, Certificate 3',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.fontParagraphText(
                        color: ColorsManager.darkGreyText,
                      ),
                    ),
                  ],
                ),
              ),
              Assets.svgs.medicVisit.svg(
                height: 56.h,
                width: 56.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
