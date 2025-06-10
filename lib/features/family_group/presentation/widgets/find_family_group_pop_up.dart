import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/dialogs/setup_dialog.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/widgets/custom_text_form_field.dart';
import 'package:healix/features/family_group/presentation/logic/family_group_cubit/family_group_cubit.dart';
import 'package:healix/features/family_group/presentation/widgets/join_family_group_pop_up.dart';

import '../../../../core/widgets/custom_button.dart';
import '../logic/family_group_cubit/family_group_state.dart';

void showFindFamilyGroupPopUp(BuildContext context) {
  final TextEditingController codeController = TextEditingController();
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
                      'Find Family Group',
                      style: AppTextStyles.fontTitleText(
                          color: ColorsManager.darkerGreyText),
                    ),
                    const CloseButton(color: Colors.black),
                  ],
                ),
                CustomTextFormField(
                  controller: codeController,
                  hintText: '123456',
                  title: 'Enter Family Group Code',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(),
                BlocProvider.value(
                  value: familyGroupCubit,
                  child: BlocListener<FamilyGroupCubit, FamilyGroupState>(
                    listenWhen: (p, c) =>
                        c is FindFamilyGroupSuccess ||
                        c is FindFamilyGroupFailure ||
                        c is FindFamilyGroupLoading,
                    listener: (context, state) {
                      if (state is FindFamilyGroupSuccess) {
                        ctx.pop();
                        showJoinFamilyGroupPopUp(
                          context,
                          state.familyGroupResponse,
                        );
                      } else if (state is FindFamilyGroupFailure) {
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
                      title: 'Find Family Group',
                      onTap: () {
                        if (!codeController.text.trim().isNullOrEmpty()) {
                          familyGroupCubit.getFamilyGroupWithCode(
                              codeController.text.trim());
                        }
                      },
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
