import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/core/widgets/custom_date_picker_widget.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class MedicineDataForm extends StatelessWidget {
  const MedicineDataForm({super.key});

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
            controller: TextEditingController(),
          ),
          CustomTextFormField(
            title: 'Frequency',
            hintText: 'e.g., Once Daily, Every 8 Hours',
            controller: TextEditingController(),
          ),
          Row(
            spacing: 16.w,
            children: [
              Expanded(
                child: CustomDatePickerWidget(
                  title: 'Start Date',
                  showIcon: false,
                  controller: TextEditingController(),
                ),
              ),
              Expanded(
                child: CustomDatePickerWidget(
                  title: 'End Date',
                  showIcon: false,
                  controller: TextEditingController(),
                ),
              ),
            ],
          ),
          CustomButton(
            title: 'Edit',
            backgroundColor: ColorsManager.grey200,
            textColor: ColorsManager.grey800,
            border: Border.all(color: ColorsManager.grey400),
            onTap: () {},
          ),
          CustomButton(
            title: 'Delete',
            textColor: ColorsManager.alertColor,
            backgroundColor: Colors.white,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
