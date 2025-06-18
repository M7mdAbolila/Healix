import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/setup_get_it.dart';
import '../../data/models/family_group_model.dart';
import '../state_management/family_summary_cubit/family_summary_cubit.dart';
import '../widgets/family_name_and_code_column.dart';
import '../widgets/my_family_list_card.dart';
import '../widgets/health_summary_widget.dart';

class MyFamilyGroupData extends StatelessWidget {
  const MyFamilyGroupData({
    super.key,
    this.familyGroup,
  });
  
  final FamilyGroupModel? familyGroup;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FamilyNameAndCodeColumn(
          familyCode: familyGroup?.code ?? '',
          familyName: familyGroup?.name ?? '',
        ),
        MyFamilyListCard(familyGroup: familyGroup),
        BlocProvider(
          create: (context) => getIt<FamilySummaryCubit>(),
          child: HealthSummaryWidget(
            familyId: familyGroup?.id ?? '',
          ),
        ),
      ],
    );
  }
}
