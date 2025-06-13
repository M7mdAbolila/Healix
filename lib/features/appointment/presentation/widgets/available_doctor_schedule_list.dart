import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/appointment/domain/entities/get_doctors_response_entity.dart';
import 'package:intl/intl.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../domain/entities/schedule_entity.dart';
import '../logic/get_schedule_cubit/get_schedule_cubit.dart';
import 'show_confirm_booking_dialog.dart';

class AvailableDoctorScheduleList extends StatefulWidget {
  const AvailableDoctorScheduleList({super.key, this.doctor});
  final DoctorEntity? doctor;

  @override
  State<AvailableDoctorScheduleList> createState() =>
      _AvailableDoctorScheduleListState();
}

class _AvailableDoctorScheduleListState
    extends State<AvailableDoctorScheduleList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && widget.doctor?.id != null) {
        final cubit = context.read<GetScheduleCubit>();
        cubit.resetState();
        cubit.getSchedule(doctorId: widget.doctor!.id);
      }
    });
  }

  List<Map<String, dynamic>> _getAvailableDays(ScheduleEntity schedule) {
    final List<Map<String, dynamic>> availableDays = [];
    final DateTime now = DateTime.now();

    final Map<int, Map<String, String?>> weekSchedule = {
      DateTime.monday: {'from': schedule.monFrom, 'to': schedule.monTo},
      DateTime.tuesday: {'from': schedule.tueFrom, 'to': schedule.tueTo},
      DateTime.wednesday: {'from': schedule.wedFrom, 'to': schedule.wedTo},
      DateTime.thursday: {'from': schedule.thuFrom, 'to': schedule.thuTo},
      DateTime.friday: {'from': schedule.friFrom, 'to': schedule.friTo},
      DateTime.saturday: {'from': schedule.satFrom, 'to': schedule.satTo},
      DateTime.sunday: {'from': schedule.sunFrom, 'to': schedule.sunTo},
    };

    for (int i = 0; i < 21 && availableDays.length < 5; i++) {
      final DateTime checkDate = now.add(Duration(days: i));
      final int weekday = checkDate.weekday;
      final Map<String, String?>? daySchedule = weekSchedule[weekday];

      if (daySchedule != null &&
          daySchedule['from'] != null &&
          daySchedule['to'] != null &&
          daySchedule['from']!.isNotEmpty &&
          daySchedule['to']!.isNotEmpty &&
          daySchedule['from'] != '00:00:00' &&
          daySchedule['to'] != '00:00:00') {
        String dayLabel;
        if (i == 0) {
          dayLabel = 'Today';
        } else if (i == 1) {
          dayLabel = 'Tomorrow';
        } else {
          dayLabel = _getDayName(weekday);
        }
        availableDays.add({
          'date': checkDate,
          'dayLabel': dayLabel,
          'dateString': DateFormat('M/d').format(checkDate),
          'dateFormatted': DateFormat('yyyy-MM-dd').format(checkDate),
          'fromTime': _formatTime(daySchedule['from']!),
          'toTime': _formatTime(daySchedule['to']!),
        });
      }
    }

    return availableDays;
  }

  String _getDayName(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }

  String _formatTime(String time) {
    try {
      final parts = time.split(':');
      if (parts.length >= 2) {
        final hour = int.parse(parts[0]);
        final minute = int.parse(parts[1]);
        final timeOfDay = TimeOfDay(hour: hour, minute: minute);

        final period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
        final hour12 =
            timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
        final minuteStr = timeOfDay.minute.toString().padLeft(2, '0');

        return '$hour12:$minuteStr $period';
      }
    } catch (e) {
      return time;
    }
    return time;
  }

  String _convertToApiTimeFormat(String displayTime) {
    try {
      // Parse display time like "2:30 PM" back to "14:30:00"
      final parts = displayTime.split(' ');
      if (parts.length == 2) {
        final timePart = parts[0];
        final period = parts[1];

        final timeParts = timePart.split(':');
        if (timeParts.length == 2) {
          int hour = int.parse(timeParts[0]);
          final int minute = int.parse(timeParts[1]);

          if (period == 'PM' && hour != 12) {
            hour += 12;
          } else if (period == 'AM' && hour == 12) {
            hour = 0;
          }

          return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:00';
        }
      }
    } catch (e) {
      return displayTime;
    }
    return displayTime;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetScheduleCubit, GetScheduleState>(
      builder: (context, state) {
        if (state is GetScheduleLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetScheduleFailure) {
          return Center(
            child: Text(
              'Failed to load schedule: ${state.errMessage}',
              style: AppTextStyles.fontSmallerText(
                color: ColorsManager.alertColor,
              ),
            ),
          );
        }
        if (state is GetScheduleSuccess && state.response.schedule != null) {
          final availableDays = _getAvailableDays(state.response.schedule!);

          if (availableDays.isEmpty) {
            return Center(
              child: Text(
                'No available appointments',
                style: AppTextStyles.fontSmallerText(
                  color: ColorsManager.darkerGreyText,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: availableDays.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final dayData = availableDays[index];
              return Container(
                padding: EdgeInsets.all(8.r),
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  color: ColorsManager.dimmedColor,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: ColorsManager.lightGreyText),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: ColorsManager.orange10,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        '${dayData['dayLabel']}\n${dayData['dateString']}',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.fontSmallerText(
                          color: ColorsManager.blue100,
                        ),
                      ),
                    ),
                    Text(
                      dayData['fromTime'],
                      textAlign: TextAlign.center,
                      style: AppTextStyles.fontSmallerText(
                        color: ColorsManager.darkerGreyText,
                      ),
                    ),
                    Text(
                      'To',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.fontSmallerText(
                        color: ColorsManager.darkerGreyText,
                      ),
                    ),
                    Text(
                      dayData['toTime'],
                      textAlign: TextAlign.center,
                      style: AppTextStyles.fontSmallerText(
                        color: ColorsManager.darkerGreyText,
                      ),
                    ),
                    CustomButton(
                      width: 66.w,
                      title: 'Book',
                      textStyle: AppTextStyles.fontTextInput(
                        color: Colors.white,
                      ),
                      onTap: () {
                        // Convert times back to API format
                        final String fromTimeApi =
                            _convertToApiTimeFormat(dayData['fromTime']);
                        final String toTimeApi =
                            _convertToApiTimeFormat(dayData['toTime']);

                        showConfirmBookingDialog(
                          context,
                          doctor: widget.doctor!,
                          day: dayData[
                              'dateFormatted'], // Pass the date in YYYY-MM-DD format
                          from: fromTimeApi,
                          to: toTimeApi,
                          dayLabel:
                              '${dayData['dayLabel']} ${dayData['dateString']}',
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
