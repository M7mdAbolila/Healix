import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/colors_manager.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class ChatTextFieldContainer extends StatelessWidget {
  const ChatTextFieldContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r),
        ),
      ),
      child: const CustomTextFormField(hintText: 'Type here...'),
    );
  }
}
