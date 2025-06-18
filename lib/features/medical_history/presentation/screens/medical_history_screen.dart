import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/di/setup_get_it.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';
import 'package:healix/features/medical_history/presentation/widgets/med_health_summary_section.dart';
import 'package:healix/features/medical_history/presentation/widgets/recent_updates_section.dart';

import '../../../main_layout/presentation/logic/navigation_cubit/navigation_cubit.dart';
import '../state_management/get_medical_records_cubit/get_medical_records_cubit.dart';
import '../state_management/patient_summary_cubit/patient_summary_cubit.dart';
import '../widgets/med_record_type_section.dart';

class MedicalHistoryScreen extends StatefulWidget {
  const MedicalHistoryScreen({super.key});

  @override
  State<MedicalHistoryScreen> createState() => _MedicalHistoryScreenState();
}

class _MedicalHistoryScreenState extends State<MedicalHistoryScreen>
    with AutomaticKeepAliveClientMixin<MedicalHistoryScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetMedicalRecordsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<PatientSummaryCubit>(),
        ),
      ],
      child: const Scaffold(
        body: MedicalHistoryScreenBody(),
      ),
    );
  }
}

class MedicalHistoryScreenBody extends StatelessWidget {
  const MedicalHistoryScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomScreenAppBar(
          title: 'Medical History',
          onBackTap: () => context.read<NavigationCubit>().previousPage(),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                verticalSpace(16),
                // const SearchBarWidget(hasFilter: true),
                // verticalSpace(32),
                const MedicalRecordTypeSection(),
                const MedHealthSummarySection(),
                const RecentUpdatesSection(),
                verticalSpace(32),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
