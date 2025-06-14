import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/di/setup_get_it.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/theming/text_styles.dart';

import '../../../../../core/theming/colors_manager.dart';
import '../../../../core/widgets/feature_title_text.dart';
import '../logic/patient_summary_cubit/patient_summary_cubit.dart';
import '../screens/patient_summary_screen.dart';

class MedHealthSummarySection extends StatelessWidget {
  const MedHealthSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        spacing: 24.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FeatureTitleText(title: 'Health Summary'),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => getIt<PatientSummaryCubit>(),
                    child: const PatientSummaryScreen(),
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: ColorsManager.lightGreyText,
                ),
              ),
              child: Row(
                spacing: 8.w,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      spacing: 8.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Medical Health Summary',
                          style: AppTextStyles.fontBodyText(
                            color: ColorsManager.darkerGreyText,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Summarized analysis for your health this Year',
                          style: AppTextStyles.fontBodyText(
                            color: ColorsManager.darkGreyText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Assets.svgs.rightArrow.svg(
                    height: 24.h,
                    width: 24.w,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
