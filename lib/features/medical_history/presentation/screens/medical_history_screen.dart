import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/routing/routes.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';
import 'package:healix/core/widgets/search_bar_widget.dart';
import 'package:healix/features/medical_history/presentation/widgets/med_health_summary_card.dart';

import '../../../../core/widgets/feature_title_text.dart';
import '../../../../core/widgets/view_all_button.dart';

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomScreenAppBar(title: 'Medical History'),
          verticalSpace(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const SearchBarWidget(hasFilter: true),
                verticalSpace(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const FeatureTitleText(title: 'Medical Record Type'),
                    ViewAllButton(
                      onTap: () =>
                          context.pushNamed(Routes.medicalRecordCategoryScreen),
                    ),
                  ],
                ),
                verticalSpace(16),
                const MedHealthSummaryCard(),
                verticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const FeatureTitleText(title: 'Recent Updates'),
                    ViewAllButton(onTap: () {}),
                  ],
                ),
                verticalSpace(8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
