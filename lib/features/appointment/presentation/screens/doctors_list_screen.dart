import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/di/setup_get_it.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/core/helpers/spacing.dart';

import '../state_management/appointment_cubit/appointment_cubit.dart';
import '../state_management/appointment_cubit/appointment_state.dart';
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
        body: Stack(
          children: [
            Column(
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
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, AppointmentState state) {
    return switch (state) {
      GetDoctorsError() => _buildErrorContent(context, state),
      GetDoctorsSuccess() => _buildSuccessContent(state),
      GetDoctorsValidationError() =>
        _buildValidationErrorContent(context, state),
      _ => _buildLoadingContent(),
    };
  }

  Widget _buildErrorContent(BuildContext context, GetDoctorsError state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64.sp,
            color: ColorsManager.darkGreyText,
          ),
          verticalSpace(16),
          Text(
            'Something went wrong',
            style: AppTextStyles.fontTextInput(
              color: ColorsManager.darkGreyText,
            ),
          ),
          verticalSpace(8),
          Text(
            state.errorMessage,
            textAlign: TextAlign.center,
            style: AppTextStyles.fontParagraphText(
              color: ColorsManager.darkGreyText,
            ),
          ),
          verticalSpace(24),
          CustomButton(
            onTap: () {
              context.read<AppointmentCubit>().getDoctors(specialtyIndex);
            },
            title: 'Retry',
            width: 120.w,
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessContent(GetDoctorsSuccess state) {
    final doctors = state.response.doctors ?? [];

    if (doctors.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64.sp,
              color: ColorsManager.darkGreyText,
            ),
            verticalSpace(16),
            Text(
              'No doctors available',
              style: AppTextStyles.fontTextInput(
                color: ColorsManager.darkGreyText,
              ),
            ),
            verticalSpace(8),
            Text(
              'No doctors found for this specialty. Please try a different specialty.',
              textAlign: TextAlign.center,
              style: AppTextStyles.fontParagraphText(
                color: ColorsManager.darkGreyText,
              ),
            ),
          ],
        ),
      );
    }

    return DoctorsListView(doctors: doctors);
  }

  Widget _buildValidationErrorContent(
      BuildContext context, GetDoctorsValidationError state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_outlined,
            size: 64.sp,
            color: Colors.orange,
          ),
          verticalSpace(16),
          Text(
            'Validation Error',
            style: AppTextStyles.fontTextInput(
              color: ColorsManager.darkGreyText,
            ),
          ),
          verticalSpace(8),
          ...state.fieldErrors.entries.map((error) => Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Text(
                  '${error.key}: ${error.value}',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.fontParagraphText(
                    color: Colors.red,
                  ),
                ),
              )),
          verticalSpace(24),
          CustomButton(
            onTap: () {
              context.read<AppointmentCubit>().clearSearch();
            },
            title: 'Clear',
            width: 120.w,
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingContent() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
