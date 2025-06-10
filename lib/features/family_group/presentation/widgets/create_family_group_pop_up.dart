import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/dialogs/setup_dialog.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/widgets/custom_text_form_field.dart';

import '../../../../core/widgets/custom_button.dart';
import '../logic/family_group_cubit/family_group_cubit.dart';
import '../logic/family_group_cubit/family_group_state.dart';

void showCreateFamilyGroupPopUp(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
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
                      'Create Family Group',
                      style: AppTextStyles.fontTitleText(
                          color: ColorsManager.darkerGreyText),
                    ),
                    const CloseButton(color: Colors.black),
                  ],
                ),
                CustomTextFormField(
                  controller: nameController,
                  hintText: 'Healix',
                  title: 'Enter Family Group Name',
                ),
                const SizedBox(),
                BlocProvider.value(
                  value: familyGroupCubit,
                  child: BlocListener<FamilyGroupCubit, FamilyGroupState>(
                    listenWhen: (previous, current) =>
                        current is CreateFamilyGroupSuccess ||
                        current is CreateFamilyGroupFailure ||
                        current is CreateFamilyGroupLoading,
                    listener: (context, state) {
                      if (state is CreateFamilyGroupSuccess) {
                        ctx.pop();
                        ctx.pop();
                        familyGroupCubit.getFamilyGroup();
                        showAwesomeSnackbar(
                          context,
                          title: 'Success',
                          message: 'Family Group Created Successfully!',
                        );
                        familyGroupCubit.getFamilyGroup();
                      } else if (state is CreateFamilyGroupFailure) {
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
                      title: 'Create Family Group',
                      onTap: () {
                        if (nameController.text.trim().isNotEmpty) {
                          familyGroupCubit
                              .createFamilyGroup(nameController.text.trim());
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
