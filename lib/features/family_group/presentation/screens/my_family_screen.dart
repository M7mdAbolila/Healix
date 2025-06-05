import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';
import 'package:healix/features/family_group/presentation/widgets/family_name_and_code_column.dart';
import 'package:healix/features/family_group/presentation/widgets/my_family_list_card.dart';

import '../widgets/health_summary_widget.dart';

class MyFamilyScreen extends StatelessWidget {
  const MyFamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomScreenAppBar(title: 'My Family'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(24),
                const FamilyNameAndCodeColumn(),
                verticalSpace(24),
                const MyFamilyListCard(),
                verticalSpace(24),
                const HealthSummaryWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
