import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/dialogs/setup_dialog.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/features/family_group/presentation/widgets/family_member_card.dart';
import '../../../../core/di/setup_get_it.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/get_family_group_response_model.dart';
import '../state_management/join_family_group_cubit/join_family_group_cubit.dart';
import '../state_management/get_family_group_cubit/get_family_group_cubit.dart';

void showJoinFamilyGroupDialog(
  BuildContext context,
  GetFamilyGroupResponseModel familyGroupResponse,
) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<JoinFamilyGroupCubit>(),
          ),
          BlocProvider.value(
            value: context.read<GetFamilyGroupCubit>(),
          ),
        ],
        child: JoinFamilyGroupDialog(familyGroupResponse: familyGroupResponse),
      );
    },
  );
}

class JoinFamilyGroupDialog extends StatelessWidget {
  final GetFamilyGroupResponseModel familyGroupResponse;

  const JoinFamilyGroupDialog({
    super.key,
    required this.familyGroupResponse,
  });

  @override
  Widget build(BuildContext context) {
    final family = familyGroupResponse.familyGroup;

    return BlocListener<JoinFamilyGroupCubit, JoinFamilyGroupState>(
      listener: (context, state) {
        if (state is JoinFamilyGroupSuccess) {
          context.read<GetFamilyGroupCubit>().getFamilyGroup();
          context.pop();
          context.pop();
          context.pop();
          showAwesomeSnackbar(
            context,
            title: 'Success',
            message: 'Successfully joined ${family?.name ?? 'Family Group'}',
          );
        } else if (state is JoinFamilyGroupFailure) {
          context.pop();
          showAwesomeSnackbar(
            context,
            title: 'Error',
            message: state.errorMessage,
            isError: true,
          );
        } else if (state is JoinFamilyGroupLoading) {
          showLoadingDialog(context);
        }
      },
      child: Center(
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              spacing: 16.h,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      family?.name ?? 'Family Group',
                      style: AppTextStyles.fontTitleText(
                          color: ColorsManager.darkerGreyText),
                    ),
                    const CloseButton(color: Colors.black),
                  ],
                ),
                ...family?.members
                        ?.take(2)
                        .map(
                          (member) => FamilyMemberCard(
                            member: member,
                          ),
                        )
                        .toList() ??
                    [],
                const SizedBox(),
                BlocBuilder<JoinFamilyGroupCubit, JoinFamilyGroupState>(
                  builder: (context, state) {
                    return CustomButton(
                      title: 'Join Family Group',
                      onTap: () {
                        if (family?.id != null) {
                          context
                              .read<JoinFamilyGroupCubit>()
                              .joinFamilyGroup(family!.id!);
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
