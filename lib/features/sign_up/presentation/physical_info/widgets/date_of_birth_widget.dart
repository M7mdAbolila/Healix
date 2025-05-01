import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/shadows_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:intl/intl.dart';

class DateOfBirthWidget extends StatefulWidget {
  const DateOfBirthWidget({super.key});

  @override
  State<DateOfBirthWidget> createState() => _DateOfBirthWidgetState();
}

class _DateOfBirthWidgetState extends State<DateOfBirthWidget> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.w,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date Of Birth',
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkGreyText,
          ),
        ),
        GestureDetector(
          onTap: () async {
            DateTime? pickedTime;
            showDialog(
              context: context,
              builder: (context) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
                      decoration: BoxDecoration(
                        color: ColorsManager.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox.shrink(),
                          const Spacer(
                            flex: 4,
                          ),
                          Text(
                            'Birhday',
                            style: AppTextStyles.fontTextInput(
                                color: Colors.white),
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          CloseButton(
                            color: Colors.white,
                            onPressed: () => context.pop(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 250.h,
                      color: Colors.white,
                      padding: EdgeInsets.all(16.r),
                      child: Column(
                        spacing: 5.h,
                        children: [
                          SizedBox(
                            height: 170.h,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (dateTime) {
                                setState(() {
                                  pickedTime = dateTime;
                                });
                              },
                            ),
                          ),
                          CustomButton(
                            title: 'Save',
                            onTap: () {
                              if (pickedTime != null) {
                                setState(() {
                                  _selectedDate = pickedTime!;
                                });
                                context.pop();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                ShadowsManager.softerShadow(),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDate == null
                      ? 'DD/MM/YYYY'
                      : DateFormat('dd/MM/yyyy').format(_selectedDate!),
                  style: AppTextStyles.fontTextInput(
                    color: _selectedDate == null
                        ? ColorsManager.grey500
                        : ColorsManager.darkGreyText,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    color: ColorsManager.lightGreyText,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 20.sp,
                    color: ColorsManager.darkGreyText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
