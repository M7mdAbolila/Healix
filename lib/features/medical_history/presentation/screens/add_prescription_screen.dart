import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/widgets/feature_title_text.dart';
import 'package:healix/features/medical_history/presentation/widgets/prescription_data_form.dart';

import '../../../../core/widgets/custom_screen_app_bar.dart';

class AddPrescriptionScreen extends StatelessWidget {
  const AddPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomScreenAppBar(title: 'Add Prescription'),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(16),
                const FeatureTitleText(title: 'Prescription Details'),
                verticalSpace(16),
                const PrescriptionDataForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
