import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/routing/routes.dart';
import 'package:healix/features/medical_history/presentation/widgets/categoreis_grid_view.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/feature_title_text.dart';

class RecentUpdatesSection extends StatelessWidget {
  const RecentUpdatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FeatureTitleText(title: 'Recent Records'),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => context.pushNamed(
                Routes.viewAllMedicalRecordsScreen,
                arguments: index,
              ),
              child: CategoryRecordCard(
                category: categories[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryRecordCard extends StatelessWidget {
  const CategoryRecordCard({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ColorsManager.lightGreyText,
        ),
      ),
      child: Row(
        spacing: 16.w,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            category.imagePath,
            height: 56.h,
            width: 56.w,
          ),
          Expanded(
            child: Text(
              category.title,
              style: AppTextStyles.fontTextInput(
                color: ColorsManager.darkerGreyText,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Assets.svgs.rightArrow.svg(
            height: 24.h,
            width: 24.w,
          ),
        ],
      ),
    );
  }
}
