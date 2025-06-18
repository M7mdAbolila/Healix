import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/widgets/feature_title_text.dart';
import 'package:healix/features/home/presentation/widgets/featured_doctor_item.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/theming/colors_manager.dart';

import '../../../appointment/presentation/state_management/appointment_cubit/appointment_cubit.dart';
import '../../../appointment/presentation/state_management/appointment_cubit/appointment_state.dart';

class FeaturedDoctorListView extends StatefulWidget {
  const FeaturedDoctorListView({super.key});

  @override
  State<FeaturedDoctorListView> createState() => _FeaturedDoctorListViewState();
}

class _FeaturedDoctorListViewState extends State<FeaturedDoctorListView> {
  @override
  void initState() {
    super.initState();
    context.read<AppointmentCubit>().getDoctors(0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FeatureTitleText(title: 'Featured Doctors'),
        SizedBox(
          height: 268.h,
          child: BlocBuilder<AppointmentCubit, AppointmentState>(
            builder: (context, state) {
              if (state is GetDoctorsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetDoctorsSuccess) {
                final doctors = state.response.doctors ?? [];
                if (doctors.isEmpty) {
                  return Center(
                    child: Text(
                      'No featured doctors available',
                      style: AppTextStyles.fontTextInput(
                        color: ColorsManager.darkGreyText,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: doctors.length > 5 ? 5 : doctors.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final doctor = doctors[index];
                    return FeaturedDoctorItem(
                      doctor: doctor,
                    );
                  },
                );
              } else if (state is GetDoctorsError) {
                return Center(
                  child: Text(
                    'Error loading doctors: ${state.errorMessage}',
                    style: AppTextStyles.fontTextInput(
                      color: ColorsManager.alertColor,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
