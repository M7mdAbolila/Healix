import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';
import 'package:healix/features/family_group/presentation/widgets/family_name_and_code_column.dart';
import 'package:healix/features/family_group/presentation/widgets/find_family_group_pop_up.dart';
import 'package:healix/features/family_group/presentation/widgets/my_family_list_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../data/models/family_group_model.dart';
import '../logic/family_group_cubit/family_group_cubit.dart';
import '../logic/family_group_cubit/family_group_state.dart';
import '../widgets/create_family_group_pop_up.dart';
import '../widgets/health_summary_widget.dart';

class MyFamilyScreen extends StatefulWidget {
  const MyFamilyScreen({super.key});

  @override
  State<MyFamilyScreen> createState() => _MyFamilyScreenState();
}

class _MyFamilyScreenState extends State<MyFamilyScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FamilyGroupCubit>().getFamilyGroup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const CustomScreenAppBar(title: 'My Family'),
          verticalSpace(24),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: BlocBuilder<FamilyGroupCubit, FamilyGroupState>(
                buildWhen: (p, c) =>
                    c is GetFamilyGroupSuccess ||
                    c is GetFamilyGroupFailure ||
                    c is GetFamilyGroupLoading,
                builder: (context, state) {
                  if (state is GetFamilyGroupSuccess) {
                    final familyGroup = state.familyGroupResponse.familyGroup;
                    return MyFamilyGroupData(familyGroup: familyGroup);
                  } else if (state is GetFamilyGroupFailure) {
                    /// This means the user has no family group (issue form backend response)
                    return state.errMessage ==
                            'Object reference not set to an instance of an object.'
                        ? const EmptyFamilyGroup()
                        : Center(
                            child: Text(
                              state.errMessage,
                              style: AppTextStyles.fontBodyText(
                                color: ColorsManager.alertColor,
                              ),
                            ),
                          );
                  } else {
                    return const LoadingFamilyGroup();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyFamilyGroup extends StatelessWidget {
  const EmptyFamilyGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FamilyNameAndCodeColumn(),
        _buildCard(
          'Create New Family Group',
          Assets.svgs.addSquare.path,
          () => showCreateFamilyGroupPopUp(context),
        ),
        _buildCard(
          'Join Family Group',
          Assets.svgs.familyListIcon.path,
          () => showFindFamilyGroupPopUp(context),
        ),
        const HealthSummaryWidget(),
      ],
    );
  }

  Widget _buildCard(String title, String iconPath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: ColorsManager.lightGreyText,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.fontBodyText(
                    color: ColorsManager.darkerGreyText,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              iconPath,
              width: 65.w,
              height: 65.h,
            ),
          ],
        ),
      ),
    );
  }
}

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
        const HealthSummaryWidget(),
      ],
    );
  }
}

class LoadingFamilyGroup extends StatelessWidget {
  const LoadingFamilyGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: const PulseEffect(
        from: ColorsManager.grey400,
        to: ColorsManager.grey200,
      ),
      child: Column(
        spacing: 24.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          FamilyNameAndCodeColumn(),
          MyFamilyListCard(),
          HealthSummaryWidget(),
        ],
      ),
    );
  }
}
