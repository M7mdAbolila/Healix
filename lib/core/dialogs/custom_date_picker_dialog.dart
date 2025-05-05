import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/widgets/custom_button.dart';

Future<DateTime?> showCustomDatePickerDialog(BuildContext context) async {
  DateTime selectedDate = DateTime.now();
  DateTime currentMonth = DateTime.now();
  List<int> years = List.generate(100, (index) => DateTime.now().year - index);

  return showDialog<DateTime>(
    context: context,
    builder: (context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        backgroundColor: Colors.white,
        child: StatefulBuilder(
          builder: (context, setState) {
            void updateCalendar(int newYear, int newMonth) {
              setState(() {
                currentMonth = DateTime(newYear, newMonth);
              });
            }

            List<Widget> buildDays() {
              final firstDayOfMonth =
                  DateTime(currentMonth.year, currentMonth.month, 1);
              final daysInMonth = DateUtils.getDaysInMonth(
                  currentMonth.year, currentMonth.month);
              final weekdayOffset = firstDayOfMonth.weekday % 7;

              List<Widget> dayWidgets = [];

              for (int i = 0; i < weekdayOffset; i++) {
                dayWidgets.add(const SizedBox());
              }

              for (int i = 1; i <= daysInMonth; i++) {
                DateTime day =
                    DateTime(currentMonth.year, currentMonth.month, i);
                bool isSelected = selectedDate.year == day.year &&
                    selectedDate.month == day.month &&
                    selectedDate.day == day.day;

                dayWidgets.add(
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = day;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? ColorsManager.primaryColor
                            : Colors.transparent,
                      ),
                      child: Text(
                        '$i',
                        style: AppTextStyles.fontTextInput(
                          color: isSelected
                              ? Colors.white
                              : ColorsManager.darkerGreyText,
                        ),
                      ),
                    ),
                  ),
                );
              }

              return dayWidgets;
            }

            return Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () {
                          int newMonth = currentMonth.month - 1;
                          int newYear = currentMonth.year;
                          if (newMonth < 1) {
                            newMonth = 12;
                            newYear--;
                          }
                          updateCalendar(newYear, newMonth);
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            DateFormat('MMMM').format(currentMonth),
                            style: AppTextStyles.fontBodyText(
                                color: ColorsManager.darkerGreyText),
                          ),
                          SizedBox(width: 8.w),
                          DropdownButton<int>(
                            value: currentMonth.year,
                            underline: const SizedBox(),
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            items: years.map((y) {
                              return DropdownMenuItem(
                                value: y,
                                child: Text(
                                  y.toString(),
                                  style: AppTextStyles.fontBodyText(
                                      color: ColorsManager.darkerGreyText),
                                ),
                              );
                            }).toList(),
                            onChanged: (year) {
                              if (year != null) {
                                updateCalendar(year, currentMonth.month);
                              }
                            },
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: () {
                          int newMonth = currentMonth.month + 1;
                          int newYear = currentMonth.year;
                          if (newMonth > 12) {
                            newMonth = 1;
                            newYear++;
                          }
                          updateCalendar(newYear, newMonth);
                        },
                      ),
                    ],
                  ),
                  verticalSpace(8),
                  // Days of week
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                        .map((e) => Expanded(
                              child: Center(
                                child: Text(
                                  e,
                                  style: AppTextStyles.fontParagraphText(
                                      color: ColorsManager.darkGreyText),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  verticalSpace(8),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 7,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    children: buildDays(),
                  ),
                  verticalSpace(16),
                  CustomButton(
                    title: 'Save',
                    onTap: () => Navigator.pop(context, selectedDate),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
