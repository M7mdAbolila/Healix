import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';
import 'package:healix/core/widgets/feature_title_text.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/search_bar_widget.dart';
import '../widgets/Medical_record_card.dart';
import '../widgets/recent_updates_section.dart';

class AllMedicalRecordsScreen extends StatelessWidget {
  const AllMedicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomScreenAppBar(title: ' Medical History'),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                verticalSpace(16),
                const SearchBarWidget(
                  hasFilter: true,
                  padding: EdgeInsets.zero,
                ),
                verticalSpace(32),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: FeatureTitleText(
                    title: 'Medical Records',
                  ),
                ),
                verticalSpace(16),
                Column(
                  spacing: 8.h,
                  children: recentRecords
                      .map((e) => MedicalRecordCard(record: e))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
