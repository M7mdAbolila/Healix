import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/features/medical_history/presentation/widgets/categoreis_grid_view.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/feature_title_text.dart';
import '../../../../core/widgets/view_all_button.dart';
import 'category_card.dart';

class MedicalRecordTypeSection extends StatelessWidget {
  const MedicalRecordTypeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Column(
        spacing: 16.h,
        children: [
          Row(
            children: [
              const FeatureTitleText(title: 'Medical Record Type'),
              const Spacer(),
              ViewAllButton(
                onTap: () => context.pushNamed(Routes.medicalCategoriesScreen),
              ),
              horizontalSpace(16),
            ],
          ),
          SizedBox(
            height: 165.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                spacing: 16.w,
                children: medRecordTypes
                    .map((e) => CategoryCard(category: e))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<CategoryModel> medRecordTypes = [
  CategoryModel(
    'Medical Visit',
    'Add a Medical Visit Record',
    Assets.svgs.medicVisit.path,
  ),
  CategoryModel(
    'Lab Tests',
    'Add Lab Test Results',
    Assets.svgs.lABTest.path,
  ),
  CategoryModel(
    'X-Rays',
    'Upload an X-Ray Result',
    Assets.svgs.xRay.path,
  ),
  CategoryModel(
    'View All',
    'Records Type List',
    Assets.svgs.viewAllIcon.path,
  ),
];
