import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/dialogs/setup_dialog.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/features/family_group/presentation/widgets/family_member_card.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../data/models/get_family_group_response_model.dart';
import '../logic/family_group_cubit/family_group_cubit.dart';
import '../logic/family_group_cubit/family_group_state.dart';

void showJoinFamilyGroupPopUp(
  BuildContext context,
  GetFamilyGroupResponseModel familyGroupResponse,
) {
  final family = familyGroupResponse.familyGroup;
  final familyGroupCubit = context.read<FamilyGroupCubit>();
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return Center(
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
                BlocProvider.value(
                  value: familyGroupCubit,
                  child: BlocListener<FamilyGroupCubit, FamilyGroupState>(
                    listenWhen: (p, c) =>
                        c is JoinFamilyGroupSuccess ||
                        c is JoinFamilyGroupFailure ||
                        c is JoinFamilyGroupLoading,
                    listener: (context, state) {
                      if (state is JoinFamilyGroupSuccess) {
                        familyGroupCubit.getFamilyGroup();
                        ctx.pop();
                        ctx.pop();
                        ctx.pop();
                        showAwesomeSnackbar(
                          context,
                          title: 'Success',
                          message:
                              'Successfully joined ${family?.name ?? 'Family Group'}',
                        );
                      } else if (state is JoinFamilyGroupFailure) {
                        ctx.pop();
                        showAwesomeSnackbar(
                          context,
                          title: 'Error',
                          message: state.errMessage,
                          isError: true,
                        );
                      } else {
                        showLoadingDialog(context);
                      }
                    },
                    child: CustomButton(
                      title: 'Join Family Group',
                      onTap: () => context
                          .read<FamilyGroupCubit>()
                          .joinFamilyGroup(family!.id!),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
