import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/features/medical_history/presentation/widgets/recent_record_card.dart';

import '../../../../core/widgets/feature_title_text.dart';
import '../../../../core/widgets/view_all_button.dart';

class RecentUpdatesSection extends StatelessWidget {
  const RecentUpdatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        spacing: 16.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const FeatureTitleText(title: 'Recent Updates'),
              ViewAllButton(onTap: () {}),
            ],
          ),
          Column(
            spacing: 8.h,
            children:
                recentRecords.map((e) => RecentRecordCard(record: e)).toList(),
          ),
        ],
      ),
    );
  }
}

List<RecentRecordModel> recentRecords = [
  RecentRecordModel(
    'Allergy',
    'You are Allergic to Dust and pollen grains',
    'HH:MM | DD/MM/YYYY',
    Assets.svgs.allergy.path,
  ),
  RecentRecordModel(
    'Chronic Disease',
    'You have high probability for getting diabetes.',
    'HH:MM | DD/MM/YYYY',
    Assets.svgs.chronicDiseaseCategory.path,
  ),
  RecentRecordModel(
    'title',
    'description',
    'HH:MM | DD/MM/YYYY',
    Assets.svgs.allergy.path,
  ),
];
