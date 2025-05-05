import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/medical_history/presentation/widgets/categoreis_grid_view.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
import '../../../../core/widgets/feature_title_text.dart';
import '../../../../core/widgets/search_bar_widget.dart';

class MedRecordCategoryScreen extends StatelessWidget {
  const MedRecordCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomScreenAppBar(title: 'Select Med-Record Type'),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                      child: FeatureTitleText(title: 'Medical Record Type'),
                    ),
                    verticalSpace(24),
                    const CategoreisGridView(),
                    verticalSpace(32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
