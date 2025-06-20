import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';
import 'package:healix/core/widgets/feature_title_text.dart';
import 'package:healix/core/di/setup_get_it.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/search_bar_widget.dart';
import '../widgets/categoreis_grid_view.dart';
import '../widgets/medical_record_api_card.dart';
import '../state_management/get_medical_records_cubit/get_medical_records_cubit.dart';
import '../state_management/get_medical_records_cubit/get_medical_records_state.dart';

class AllMedicalRecordsScreen extends StatelessWidget {
  const AllMedicalRecordsScreen({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetMedicalRecordsCubit>()
        ..getMedicalRecordsByType(selectedIndex),
      child: Scaffold(
        body: Column(
          children: [
            CustomScreenAppBar(title: categories[selectedIndex].title),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  children: [
                    verticalSpace(16),
                    const SearchBarWidget(
                      hasFilter: true,
                      padding: EdgeInsets.zero,
                    ),
                    verticalSpace(32),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: FeatureTitleText(
                        title: 'Medical Records',
                      ),
                    ),
                    verticalSpace(16),
                    Expanded(
                      child: BlocBuilder<GetMedicalRecordsCubit,
                          GetMedicalRecordsState>(
                        builder: (context, state) {
                          if (state is GetMedicalRecordsLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is GetMedicalRecordsSuccess) {
                            if (state.response.records.isEmpty) {
                              return const Center(
                                child: Text('No medical records found'),
                              );
                            }
                            return ListView.builder(
                              itemCount: state.response.records.length,
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                final record = state.response.records[index];
                                return MedicalRecordApiCard(
                                  record: record,
                                  categoryIndex: selectedIndex,
                                );
                              },
                            );
                          } else if (state is GetMedicalRecordsError) {
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
                                      context
                                          .read<GetMedicalRecordsCubit>()
                                          .getMedicalRecordsByType(
                                              selectedIndex);
                                    },
                                    title: 'Retry',
                                  ),
                                ],
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
