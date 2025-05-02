import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/text_styles.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widgets/white_back_button.dart';
import '../../domain/entities/observation.dart';
import 'observation_details_screen.dart';

class ObservationsScreen extends StatelessWidget {
  const ObservationsScreen({super.key, this.observations});
  final List<Observation>? observations;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildScreenHeader(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: _buildObservationsListView(),
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildObservationsListView() {
    return ListView.builder(
      itemCount: observations!.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => _buildObservationCard(index, context),
    );
  }

  Container _buildObservationCard(int index, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        gradient: index == 0
            ? LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: ColorsManager.mostLikelyCardGradintColors,
              )
            : null,
      ),
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            observations![index].condition,
            style: AppTextStyles.fontTitleText(
              color: index == 0 ? Colors.white : ColorsManager.grey800,
            ),
          ),
          _buildProbabilityContainer(index),
          Row(
            spacing: 16.w,
            children: [
              Expanded(
                child: Text(
                  observations![index].description,
                  style: AppTextStyles.fontParagraphText(
                    color:
                        index == 0 ? Colors.white : ColorsManager.darkGreyText,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _buildNextButton(index, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton(int index, BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ObservationDetailsScreen(
            observation: observations![index],
            index: index,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          color: index == 0 ? ColorsManager.orange10 : ColorsManager.blue10,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          'Next',
          style: AppTextStyles.fontParagraphText(
            color:
                index == 0 ? ColorsManager.orange : ColorsManager.primaryColor,
          ),
        ),
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
        observations![index].probability,
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
            'Observations',
            style: AppTextStyles.fontTitleText(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
