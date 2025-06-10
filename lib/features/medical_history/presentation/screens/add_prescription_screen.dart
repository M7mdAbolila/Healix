import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/core/widgets/feature_title_text.dart';
import 'package:healix/features/medical_history/presentation/widgets/medicine_data_form.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';
import '../logic/medical_history_cubit/medical_history_cubit.dart';
import '../logic/medical_history_cubit/medical_history_state.dart';

class AddPrescriptionScreen extends StatelessWidget {
  const AddPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            const CustomScreenAppBar(title: 'Add Prescription'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: BlocBuilder<MedicalHistoryCubit, MedicalHistoryState>(
                    builder: (context, state) {
                      final cubit = context.read<MedicalHistoryCubit>();
                      return Column(
                        spacing: 16.h,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const FeatureTitleText(
                                  title: 'Prescription Details'),
                              TextButton(
                                onPressed: () => cubit.clearAllMedicines(),
                                child: Text(
                                  'Clear All',
                                  style: AppTextStyles.fontParagraphText(
                                    color: ColorsManager.alertColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: cubit.medicines.length,
                            itemBuilder: (_, index) {
                              return MedicineDataForm(
                                medicineData: cubit.medicines[index],
                                showDeleteButton: cubit.medicines.length > 1,
                                onDelete: cubit.medicines.length > 1
                                    ? () => cubit.removeMedicine(index)
                                    : null,
                              );
                            },
                          ),
                          CustomButton(
                            title: 'Add Medicine',
                            width: 180.w,
                            backgroundColor: ColorsManager.lightGreyText,
                            textStyle: AppTextStyles.fontParagraphText(
                              color: ColorsManager.grey800,
                            ),
                            onTap: () => cubit.addMedicine(),
                          ),
                          verticalSpace(100),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
