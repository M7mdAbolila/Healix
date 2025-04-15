import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone number',
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkGreyText,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(61, 158, 158, 158),
                blurRadius: 5.6.r,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Row(
            spacing: 8.w,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: ColorsManager.primaryColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  '+20',
                  style: AppTextStyles.fontSmallerText(
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone number is required';
                    } else if (!AppRegex.isPhoneNumberValid(value)) {
                      return 'Enter a valid phone number';
                    }
                    return null;
                  },
                  cursorColor: ColorsManager.primaryColor,
                  decoration: InputDecoration(
                    isDense: true,
                    errorMaxLines: 4,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
                    hintStyle: AppTextStyles.fontParagraphText(
                      color: ColorsManager.lightGreyText,
                    ),
                    hintText: '012345678',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
