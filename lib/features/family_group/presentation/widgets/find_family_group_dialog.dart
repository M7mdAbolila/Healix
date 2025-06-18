import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/dialogs/setup_dialog.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/widgets/custom_text_form_field.dart';
import '../../../../core/di/setup_get_it.dart';
import '../../../../core/widgets/custom_button.dart';
import '../state_management/find_family_group_cubit/find_family_group_cubit.dart';
import '../state_management/get_family_group_cubit/get_family_group_cubit.dart';
import 'join_family_group_dialog.dart';

void showFindFamilyGroupDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<FindFamilyGroupCubit>(),
          ),
          BlocProvider.value(
            value: context.read<GetFamilyGroupCubit>(),
          ),
        ],
        child: const FindFamilyGroupDialog(),
      );
    },
  );
}

class FindFamilyGroupDialog extends StatelessWidget {
  const FindFamilyGroupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FindFamilyGroupCubit, FindFamilyGroupState>(
      listener: (context, state) {
        if (state is FindFamilyGroupSuccess) {
          context.pop();
          showJoinFamilyGroupDialog(
            context,
            state.response,
          );
        } else if (state is FindFamilyGroupFailure) {
          context.pop();
          showAwesomeSnackbar(
            context,
            title: 'Error',
            message: state.errorMessage,
            isError: true,
          );
        } else if (state is FindFamilyGroupLoading) {
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
                      'Find Family Group',
                      style: AppTextStyles.fontTitleText(
                          color: ColorsManager.darkerGreyText),
                    ),
                    const CloseButton(color: Colors.black),
                  ],
                ),
                BlocBuilder<FindFamilyGroupCubit, FindFamilyGroupState>(
                  builder: (context, state) {
                    final cubit = context.read<FindFamilyGroupCubit>();
                    return Form(
                      key: cubit.formManager.formKey,
                      child: CustomTextFormField(
                        controller:
                            cubit.formManager.familyCodeController.controller,
                        hintText: '123456',
                        title: 'Enter Family Group Code',
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        validator: cubit.validateFamilyCode,
                      ),
                    );
                  },
                ),
                const SizedBox(),
                BlocBuilder<FindFamilyGroupCubit, FindFamilyGroupState>(
                  builder: (context, state) {
                    return CustomButton(
                      title: 'Find Family Group',
                      onTap: () {
                        context.read<FindFamilyGroupCubit>().findFamilyGroup();
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
