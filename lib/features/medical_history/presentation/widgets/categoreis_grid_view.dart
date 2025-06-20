import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/routing/routes.dart';
import 'package:healix/features/medical_history/presentation/widgets/category_card.dart';

class CategoreisGridView extends StatefulWidget {
  const CategoreisGridView({super.key});

  @override
  State<CategoreisGridView> createState() => _CategoreisGridViewState();
}

class _CategoreisGridViewState extends State<CategoreisGridView> {
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

final List<CategoryModel> categories = [
  CategoryModel(
    'Medical Visit',
    'Add a Medical Visit Record',
    Assets.svgs.medicVisit.path,
    route: Routes.addMedicalVistScreen,
  ),
  CategoryModel(
    'Lab Tests',
    'Add Lab Test Results',
    Assets.svgs.lABTest.path,
    route: Routes.addLabTestScreen,
  ),
  CategoryModel(
    'X-Rays',
    'Upload an X-Ray Result',
    Assets.svgs.xRay.path,
    route: Routes.addXRayScreen,
  ),
  CategoryModel(
    'Surgery',
    'Add Recent Surgery Record',
    Assets.svgs.surgery.path,
    route: Routes.addSurgeryScreen,
  ),
  CategoryModel(
    'Allergy',
    'Add Recent Allergy Diagnoses',
    Assets.svgs.allergy.path,
    route: Routes.addAllergyScreen,
  ),
  CategoryModel(
    'Logs',
    'Upload a New Medical Log',
    Assets.svgs.logs.path,
    route: Routes.addLogsScreen,
  ),
  CategoryModel(
    'Chronic',
    'Add a Chronic Disease Record',
    Assets.svgs.chronicDiseaseCategory.path,
    route: Routes.addChronicDiseaseScreen,
  ),
  CategoryModel(
    'Hereditary',
    'Add a Hereditary Disease Record',
    Assets.svgs.hereditaryDisease.path,
    route: Routes.addHereditaryDiseaseScreen,
  ),
];

class CategoryModel {
  final String title;
  final String subTitle;
  final String imagePath;
  final String? route;
  CategoryModel(this.title, this.subTitle, this.imagePath, {this.route});
}
