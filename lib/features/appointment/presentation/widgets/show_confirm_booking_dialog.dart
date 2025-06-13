import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/appointment/domain/entities/get_doctors_response_entity.dart';

import '../../../../core/di/setup_get_it.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../logic/book_appointment_cubit/book_appointment_cubit.dart';
import 'clinc_container.dart';
import 'fees_location_experience_widgets.dart';

Future<dynamic> showConfirmBookingDialog(
  BuildContext context, {
  required DoctorEntity doctor,
  required String day,
  required String from,
  required String to,
  required String dayLabel,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => getIt<BookAppointmentCubit>(),
        child: Dialog(
          insetPadding: EdgeInsets.all(16.r),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Confirm Booking',
                      style: AppTextStyles.fontTextInput(
                        color: ColorsManager.grey700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(2.r),
                        decoration: BoxDecoration(
                          color: ColorsManager.grey400,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.close_rounded,
                          color: ColorsManager.darkGreyText,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(16),
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: doctor.photoUrl != null
                        ? CachedNetworkImage(
                            imageUrl: doctor.photoUrl!,
                            height: 300.h,
                            width: 300.w,
                            fit: BoxFit.cover,
                          )
                        : Assets.svgs.doctorPlaceHolder.svg(
                            height: 300.h,
                            width: 300.w,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                verticalSpace(16),
                Text(
                  'Dr. ${doctor.fname ?? ''} ${doctor.lname ?? ''}',
                  style: AppTextStyles.fontTextInput(
                    color: ColorsManager.darkerGreyText,
                  ),
                ),
                verticalSpace(8),
                Text(
                  doctor.professionalTitle ?? '',
                  style: AppTextStyles.fontParagraphText(
                    color: ColorsManager.darkGreyText,
                  ),
                ),
                verticalSpace(16),
                ClincContainer(clinic: doctor.clinic),
                verticalSpace(16),
                FeesLocationExperienceWidgets(
                  hasExperience: false,
                  fees: doctor.clinic?.fees.toString() ?? '0',
                  location: doctor.clinic?.city ?? '',
                ),
                verticalSpace(16),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 8.h),
                  decoration: BoxDecoration(
                    color: ColorsManager.dimmedBackground,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text(
                      '$dayLabel $from - $to',
                      style: AppTextStyles.fontTextInput(
                        color: ColorsManager.darkGreyText,
                      ),
                    ),
                  ),
                ),
                verticalSpace(16),
                BlocConsumer<BookAppointmentCubit, BookAppointmentState>(
                  listener: (context, state) {
                    if (state is BookAppointmentSuccess) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Appointment booked successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else if (state is BookAppointmentError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errMessage),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state is BookAppointmentLoading;
                    return CustomButton(
                      title: isLoading ? 'Booking...' : 'Confirm Book',
                      enable: !isLoading,
                      onTap: () {
                        if (!isLoading) {
                          context.read<BookAppointmentCubit>().bookAppointment(
                                day: day,
                                from: from,
                                to: to,
                                doctorId: doctor.id!,
                              );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
