import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
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
          const CustomScreenAppBar(title: 'Observations Details'),
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
}
