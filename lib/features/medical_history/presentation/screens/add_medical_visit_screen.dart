import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/widgets/custom_text_form_field.dart';

import '../../../../core/widgets/custom_screen_app_bar.dart';

class AddMedicalVisitScreen extends StatelessWidget {
  const AddMedicalVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomScreenAppBar(title: 'Medical Visit'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                verticalSpace(24),
                const CustomTextFormField(
                  hintText: 'Visit Date',
                  title: 'Visit Date',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
