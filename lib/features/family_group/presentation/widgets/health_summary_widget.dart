import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/text_styles.dart';

import '../../../../core/theming/colors_manager.dart';
import '../state_management/family_summary_cubit/family_summary_cubit.dart';

class HealthSummaryWidget extends StatefulWidget {
  const HealthSummaryWidget({super.key, this.familyId});
  final String? familyId;

  @override
  State<HealthSummaryWidget> createState() => _HealthSummaryWidgetState();
}

class _HealthSummaryWidgetState extends State<HealthSummaryWidget> {
  @override
  void initState() {
    super.initState();
    context.read<FamilySummaryCubit>().getFamilySummary(widget.familyId ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Health Summary',
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        BlocBuilder<FamilySummaryCubit, FamilySummaryState>(
          buildWhen: (previous, current) =>
              current is FamilySummaryLoading ||
              current is FamilySummarySuccess ||
              current is FamilySummaryFailure,
          builder: (context, state) {
            if (state is FamilySummaryFailure) {
              return Container(
                height: 200.h,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: ColorsManager.lightGreyText,
                  ),
                ),
                child: Center(
                  child: Text(
                    state.errorMessage,
                    style: AppTextStyles.fontBodyText(
                      color: ColorsManager.alertColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            } else if (state is FamilySummarySuccess) {
              final summary = state.summary.summary;
              return Container(
                height: 400.h,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: ColorsManager.lightGreyText,
                  ),
                ),
                child: SingleChildScrollView(
                  child: MarkdownBody(
                    data: summary,
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
                  ),
                ),
              );
            } else {
              return Container(
                height: 200.h,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: ColorsManager.lightGreyText,
                  ),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.primaryColor,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
