import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';
import 'package:healix/core/widgets/feature_title_text.dart';
import 'package:healix/core/widgets/view_all_button.dart';
import 'package:healix/features/my_activity/presentation/widgets/activity_appointment_card.dart';

class MyActivityScreen extends StatelessWidget {
  const MyActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomScreenAppBar(title: 'My Activity'),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const FeatureTitleText(title: 'Upcoming Appointments'),
                        ViewAllButton(onTap: () {}),
                      ],
                    ),
                    verticalSpace(16),
                    const ActivityAppointmentCard(),
                    verticalSpace(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const FeatureTitleText(title: 'Previous Appointments'),
                        ViewAllButton(onTap: () {}),
                      ],
                    ),
                    verticalSpace(16),
                    const ActivityAppointmentCard(status: 'Completed'),
                    verticalSpace(8),
                    const ActivityAppointmentCard(status: 'Cancelled'),
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
