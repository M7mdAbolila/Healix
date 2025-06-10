import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/core/widgets/custom_date_picker_widget.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../logic/medicine_form_data.dart';

class MedicineDataForm extends StatefulWidget {
  final MedicineFormData medicineData;
  final VoidCallback? onSave;
  final VoidCallback? onDelete;
  final bool showDeleteButton;

  const MedicineDataForm({
    super.key,
    required this.medicineData,
    this.onSave,
    this.onDelete,
    this.showDeleteButton = true,
  });

  @override
  State<MedicineDataForm> createState() => _MedicineDataFormState();
}

class _MedicineDataFormState extends State<MedicineDataForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ColorsManager.lightGreyText,
        ),
      ),
      child: Column(
        spacing: 16.h,
        children: [
          CustomTextFormField(
            title: 'Medicine Name',
            hintText: 'e.g., Paracetamol, Ventolin',
            controller: widget.medicineData.medicineNameController,
            textInputAction: TextInputAction.next,
          ),
          CustomTextFormField(
            title: 'Frequency',
            hintText: 'e.g., Once Daily, Every 8 Hours',
            controller: widget.medicineData.frequencyController,
            textInputAction: TextInputAction.next,
          ),
          Row(
            spacing: 16.w,
            children: [
              Expanded(
                child: CustomDatePickerWidget(
                  title: 'Start Date',
                  showIcon: false,
                  controller: widget.medicineData.startDateController,
                ),
              ),
              Expanded(
                child: CustomDatePickerWidget(
                  title: 'End Date',
                  showIcon: false,
                  controller: widget.medicineData.endDateController,
                ),
              ),
            ],
          ),
          if (widget.showDeleteButton && widget.onDelete != null)
            CustomButton(
              title: 'Delete',
              textColor: ColorsManager.alertColor,
              backgroundColor: Colors.white,
              onTap: widget.onDelete!,
            ),
        ],
      ),
    );
  }
}
