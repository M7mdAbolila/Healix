import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';
import '../logic/patient_summary_cubit/patient_summary_cubit.dart';
import '../logic/patient_summary_cubit/patient_summary_state.dart';

class PatientSummaryScreen extends StatefulWidget {
  const PatientSummaryScreen({super.key});

  @override
  State<PatientSummaryScreen> createState() => _PatientSummaryScreenState();
}

class _PatientSummaryScreenState extends State<PatientSummaryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PatientSummaryCubit>().getPatientSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.dimmedBackground,
      body: Column(
        children: [
          const CustomScreenAppBar(
            title: 'Health Summary',
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Expanded(
              child: BlocBuilder<PatientSummaryCubit, PatientSummaryState>(
                builder: (context, state) {
                  if (state is PatientSummarySuccess) {
                    return MarkdownBody(
                      data: state.patientSummary.summary ?? '',
                      styleSheet: MarkdownStyleSheet(
                        p: AppTextStyles.fontBodyText(
                          color: ColorsManager.blue100,
                        ),
                        h1: AppTextStyles.fontTitleText(
                          color: ColorsManager.blue100,
                        ),
                        h2: AppTextStyles.fontHeaderText(
                          color: ColorsManager.blue100,
                        ),
                        strong: AppTextStyles.fontTextInput(
                          color: ColorsManager.blue100,
                        ),
                        listBullet: AppTextStyles.fontParagraphText(
                          color: ColorsManager.blue100,
                        ),
                      ),
                    );
                  }
                  if (state is PatientSummaryError) {
                    return Center(
                      child: Text(
                        state.errMessage,
                        style: AppTextStyles.fontBodyText(
                          color: ColorsManager.alertColor,
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.primaryColor,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
