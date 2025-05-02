import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/white_back_button.dart';
import '../../domain/entities/observation.dart';

class ObservationDetailsScreen extends StatelessWidget {
  const ObservationDetailsScreen(
      {super.key, required this.observation, required this.index});
  final Observation observation;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildScreenHeader(),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                Row(
                  spacing: 16.w,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      observation.condition,
                      style: AppTextStyles.fontTitleText(
                        color: ColorsManager.darkerGreyText,
                      ),
                    ),
                    _buildProbabilityContainer(index),
                  ],
                ),
                verticalSpace(24),
                Text(
                  observation.description,
                  style: AppTextStyles.fontBodyText(
                    color: ColorsManager.darkerGreyText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildProbabilityContainer(int index) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4.h,
        horizontal: 8.w,
      ),
      decoration: BoxDecoration(
        color: index == 0 ? ColorsManager.orange10 : ColorsManager.blue10,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        observation.probability,
        style: AppTextStyles.fontParagraphText(
          color: index == 0 ? ColorsManager.orange : ColorsManager.primaryColor,
        ),
      ),
    );
  }

  Container _buildScreenHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 60.h, 16.w, 24.h),
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8.r),
        ),
      ),
      child: Row(
        spacing: 16.w,
        children: [
          const WhiteBackButton(),
          Text(
            'Observations Details',
            style: AppTextStyles.fontTitleText(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
