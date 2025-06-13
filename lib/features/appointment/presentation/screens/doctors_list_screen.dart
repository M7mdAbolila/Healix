import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/di/setup_get_it.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/core/helpers/spacing.dart';

import '../logic/appointment_cubit/appointment_cubit.dart';
import '../widgets/doctors_list_view.dart';

class DoctorsListScreen extends StatelessWidget {
  const DoctorsListScreen({super.key, required this.specialtyIndex});
  final int specialtyIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<AppointmentCubit>()..getDoctors(specialtyIndex),
      child: Scaffold(
        body: Column(
          children: [
            const CustomScreenAppBar(title: 'Choose Doctor'),
            Expanded(
              child: BlocBuilder<AppointmentCubit, AppointmentState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.all(16.r),
                      child: _buildContent(context, state),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, AppointmentState state) {
    if (state is GetDoctorsError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error: ${state.errMessage}',
              textAlign: TextAlign.center,
            ),
            verticalSpace(16),
            CustomButton(
              onTap: () {
                context.read<AppointmentCubit>().getDoctors(specialtyIndex);
              },
              title: 'Retry',
            ),
          ],
        ),
      );
    } else if (state is GetDoctorsSuccess) {
      final doctors = state.response.doctors ?? [];
      if (doctors.isEmpty) {
        return Center(
          child: Text(
            'No doctors available for this specialty.',
            style: AppTextStyles.fontTextInput(
              color: ColorsManager.darkGreyText,
            ),
          ),
        );
      }
      return DoctorsListView(doctors: doctors);
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
