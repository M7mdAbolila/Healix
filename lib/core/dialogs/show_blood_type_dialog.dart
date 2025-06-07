import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/logging.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/widgets/custom_button.dart';

import '../constants/constants.dart';
import '../theming/colors_manager.dart';

showCustomBloodTypeDialog(BuildContext context) async {
  int? selectedIndex;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: ColorsManager.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        horizontalSpace(40),
                        Text(
                          'Blood Type',
                          style: AppTextStyles.fontHeaderText(
                            color: Colors.white,
                          ),
                        ),
                        const CloseButton(color: Colors.white),
                      ],
                    ),
                  ),
                  verticalSpace(25),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: bloodTypes.map((bloodType) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              Logging.info('Selected blood type: $bloodType');
                              selectedIndex = bloodTypes.indexOf(bloodType);
                            });
                          },
                          child: Container(
                            height: 40.h,
                            width: 65.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  selectedIndex == bloodTypes.indexOf(bloodType)
                                      ? ColorsManager.primaryColor
                                      : Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Text(
                                bloodType,
                                style: AppTextStyles.fontParagraphText(
                                  color: selectedIndex ==
                                          bloodTypes.indexOf(bloodType)
                                      ? Colors.white
                                      : ColorsManager.darkGreyText,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  verticalSpace(25),
                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: CustomButton(
                      title: 'Save',
                      onTap: () {
                        if (selectedIndex != null) {
                          Navigator.pop(context, selectedIndex);
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      });
}
