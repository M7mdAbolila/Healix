import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/features/medical_history/presentation/widgets/category_card.dart';

class CategoreisGridView extends StatelessWidget {
  const CategoreisGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 165.w / 168.h,
      ),
      itemBuilder: (context, index) {
        return CategoryCard(
          category: categories[index],
        );
      },
    );
  }
}

List<CategoryModel> categories = [
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
    'Surgery',
    'Add Recent Surgery Record',
    Assets.svgs.surgery.path,
  ),
  CategoryModel(
    'Allergy',
    'Add Recent Allergy Diagnoses',
    Assets.svgs.allergy.path,
  ),
  CategoryModel(
    'Logs',
    'Upload a New Medical Log',
    Assets.svgs.logs.path,
  ),
  CategoryModel(
    'Chronic',
    'Add a Chronic Disease Record',
    Assets.svgs.chronicDiseaseCategory.path,
  ),
  CategoryModel(
    'Hereditary',
    'Add a Hereditary Disease Record',
    Assets.svgs.hereditaryDisease.path,
  ),
];

class CategoryModel {
  final String title;
  final String subTitle;
  final String imagePath;

  CategoryModel(
    this.title,
    this.subTitle,
    this.imagePath,
  );
}
