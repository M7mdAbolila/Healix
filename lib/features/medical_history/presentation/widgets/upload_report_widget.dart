import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/medical_history/presentation/screens/uploaded_files_screen.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class UploadAReportWidget extends StatelessWidget {
  const UploadAReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const UploadedFilesScreen(),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: ColorsManager.lightGreyText,
          ),
        ),
        child: Row(
          spacing: 8.w,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                spacing: 8.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upload a Report',
                    style: AppTextStyles.fontBodyText(
                      color: ColorsManager.darkerGreyText,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Lab results, Medical reports, etc. Image/ PDF',
                    style: AppTextStyles.fontBodyText(
                      color: ColorsManager.darkGreyText,
                    ),
                  ),
                ],
              ),
            ),
            Assets.svgs.rightArrow.svg(
              height: 24.h,
              width: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
