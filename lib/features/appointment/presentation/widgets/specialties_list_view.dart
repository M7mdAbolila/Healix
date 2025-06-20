import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/appointment/presentation/widgets/specialt_card_widget.dart';

import '../../../../core/gen/assets.gen.dart';

class SpecialtiesListView extends StatelessWidget {
  const SpecialtiesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _specialties.length,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => SpecialtCardWidget(
        title: _specialties[index].title,
        iconPath: _specialties[index].iconPath,
        index: index,
      ),
    );
  }
}

class _SpecialtModel {
  final String title;
  final String iconPath;

  _SpecialtModel({required this.title, required this.iconPath});
}

final List<_SpecialtModel> _specialties = [
  _SpecialtModel(
      title: 'General Practice', iconPath: Assets.svgs.generalPractice.path),
  _SpecialtModel(title: 'Allergy', iconPath: Assets.svgs.allergy.path),
  _SpecialtModel(title: 'Cardiology', iconPath: Assets.svgs.cardiology.path),
  _SpecialtModel(title: 'Audiology', iconPath: Assets.svgs.audiology.path),
  _SpecialtModel(
      title: 'Chest & Respiratory',
      iconPath: Assets.svgs.chestRespiratory.path),
  _SpecialtModel(
      title: 'Internal Medicine', iconPath: Assets.svgs.internalMedicine.path),
  _SpecialtModel(title: 'New Born', iconPath: Assets.svgs.newBorn.path),
  _SpecialtModel(
      title: 'Ophthalmology', iconPath: Assets.svgs.ophthalmology.path),
  _SpecialtModel(title: 'Orthopedics', iconPath: Assets.svgs.orthopedics.path),
  _SpecialtModel(
      title: 'Pain Management', iconPath: Assets.svgs.painManagement.path),
  _SpecialtModel(title: 'Dermatology', iconPath: Assets.svgs.dermatology.path),
  _SpecialtModel(title: 'Dentistry', iconPath: Assets.svgs.dentistry.path),
  _SpecialtModel(title: 'Psychiatry', iconPath: Assets.svgs.psychiatry.path),
  _SpecialtModel(title: 'Neurology', iconPath: Assets.svgs.neuro.path),
  _SpecialtModel(
      title: 'Ear, Nose, and Throat', iconPath: Assets.svgs.earNoseThroat.path),
];
