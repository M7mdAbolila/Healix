import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/colors_manager.dart';

import '../../../../core/theming/text_styles.dart';

class DoctorTagsRow extends StatelessWidget {
  const DoctorTagsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: tags
                .map(
                  (e) => Container(
                    padding: EdgeInsets.all(8.r),
                    margin: EdgeInsets.only(left: 16.w),
                    decoration: BoxDecoration(
                      color: ColorsManager.blue10,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: ColorsManager.primaryColor),
                    ),
                    child: Text(e, style: AppTextStyles.fontParagraphText()),
                  ),
                )
                .toList(),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 50.h,
            width: 40.w,
            decoration: const BoxDecoration(
              color: ColorsManager.dimmedBackground,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white10,
                  Colors.white30,
                  Colors.white,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List tags = [
  'Good Listener',
  'Informative',
  'Proficient',
  'Good Listener',
  'Kind',
];
