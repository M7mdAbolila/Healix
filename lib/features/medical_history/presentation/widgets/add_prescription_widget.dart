import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/medical_history/presentation/state_management/add_medical_record_cubit/add_medical_record_cubit.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../screens/add_prescription_screen.dart';

class AddPrescriptionWidget extends StatelessWidget {
  const AddPrescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final addMedicalRecordCubit = context.read<AddMedicalRecordCubit>();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: addMedicalRecordCubit,
              child: const AddPrescriptionScreen(),
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
                    'Add Prescription',
                    style: AppTextStyles.fontBodyText(
                      color: ColorsManager.darkerGreyText,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Medication Plans, Pills Details, etc. Image/ PDF',
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
    );
  }
}
