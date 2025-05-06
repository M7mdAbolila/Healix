import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/core/widgets/feature_title_text.dart';
import 'package:healix/features/medical_history/presentation/widgets/medicine_data_form.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_screen_app_bar.dart';

class AddPrescriptionScreen extends StatefulWidget {
  const AddPrescriptionScreen({super.key});

  @override
  State<AddPrescriptionScreen> createState() => _AddPrescriptionScreenState();
}

class _AddPrescriptionScreenState extends State<AddPrescriptionScreen> {
  List<Widget> _medicineDataForms = [const MedicineDataForm()];

  void _addMedicineDataForm() {
    setState(() {
      _medicineDataForms = List.from(_medicineDataForms)
        ..add(const MedicineDataForm());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomScreenAppBar(title: 'Add Prescription'),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  spacing: 16.h,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: FeatureTitleText(title: 'Prescription Details'),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: _medicineDataForms.length,
                      itemBuilder: (_, index) {
                        return _medicineDataForms[index];
                      },
                    ),
                    CustomButton(
                      title: 'Add Medicine',
                      width: 180.w,
                      backgroundColor: ColorsManager.lightGreyText,
                      textStyle: AppTextStyles.fontParagraphText(
                        color: ColorsManager.grey800,
                      ),
                      onTap: _addMedicineDataForm,
                    ),
                    verticalSpace(100),
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
