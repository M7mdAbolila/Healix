import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healix/features/medical_history/presentation/widgets/categoreis_grid_view.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ColorsManager.lightGreyText,
        ),
      ),
      child: Column(
        spacing: 8.h,
        children: [
          SvgPicture.asset(
            category.imagePath,
            height: 56.h,
            width: 56.w,
          ),
          Text(
            category.title,
            style: AppTextStyles.fontTextInput(
              color: ColorsManager.darkerGreyText,
            ),
          ),
          Text(
            category.subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.fontSmallerText(
              color: ColorsManager.darkGreyText,
            ),
          ),
        ],
      ),
    );
  }
}
