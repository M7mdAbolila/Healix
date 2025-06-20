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
import '../state_management/create_family_group_cubit/create_family_group_cubit.dart';
import '../state_management/get_family_group_cubit/get_family_group_cubit.dart';

void showCreateFamilyGroupDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<CreateFamilyGroupCubit>(),
          ),
          BlocProvider.value(
            value: context.read<GetFamilyGroupCubit>(),
          ),
        ],
        child: const CreateFamilyGroupDialog(),
      );
    },
  );
}

class CreateFamilyGroupDialog extends StatelessWidget {
  const CreateFamilyGroupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateFamilyGroupCubit, CreateFamilyGroupState>(
      listener: (context, state) {
        if (state is CreateFamilyGroupSuccess) {
          context.pop();
          context.pop();
          context.read<GetFamilyGroupCubit>().getFamilyGroup();
          showAwesomeSnackbar(
            context,
            title: 'Success',
            message: 'Family Group Created Successfully!',
          );
        } else if (state is CreateFamilyGroupFailure) {
          context.pop();
          showAwesomeSnackbar(
            context,
            title: 'Error',
            message: state.errorMessage,
            isError: true,
          );
        } else if (state is CreateFamilyGroupLoading) {
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
                      'Create Family Group',
                      style: AppTextStyles.fontTitleText(
                          color: ColorsManager.darkerGreyText),
                    ),
                    const CloseButton(color: Colors.black),
                  ],
                ),
                BlocBuilder<CreateFamilyGroupCubit, CreateFamilyGroupState>(
                  builder: (context, state) {
                    final cubit = context.read<CreateFamilyGroupCubit>();
                    return Form(
                      key: cubit.formManager.formKey,
                      child: CustomTextFormField(
                        controller:
                            cubit.formManager.familyNameController.controller,
                        hintText: 'Healix',
                        title: 'Enter Family Group Name',
                        validator: cubit.validateFamilyName,
                      ),
                    );
                  },
                ),
                const SizedBox(),
                BlocBuilder<CreateFamilyGroupCubit, CreateFamilyGroupState>(
                  builder: (context, state) {
                    return CustomButton(
                      title: 'Create Family Group',
                      onTap: () {
                        context
                            .read<CreateFamilyGroupCubit>()
                            .createFamilyGroup();
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
