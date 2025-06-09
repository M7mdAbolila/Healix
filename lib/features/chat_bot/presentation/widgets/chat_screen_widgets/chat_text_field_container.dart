import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/theming/colors_manager.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/chat_cubit/chat_cubit.dart';
import 'selected_files_widget.dart';

class ChatTextFieldContainer extends StatefulWidget {
  const ChatTextFieldContainer({super.key});

  @override
  State<ChatTextFieldContainer> createState() => _ChatTextFieldContainerState();
}

class _ChatTextFieldContainerState extends State<ChatTextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r),
        ),
      ),
      child: Column(
        spacing: 8.h,
        children: [
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              final cubit = context.read<ChatCubit>();
              return SelectedFilesWidget(
                selectedFiles: cubit.selectedFiles,
                onRemoveFile: cubit.removeFile,
                onClearAll: cubit.clearSelectedFiles,
                onAddMoreFiles: cubit.pickMoreFiles,
                totalSize: cubit.totalSelectedFilesSize,
              );
            },
          ),
          CustomTextFormField(
            hintText: 'Type here...',
            controller: context.read<ChatCubit>().messageController,
            onFieldSubmit: (_) => context.read<ChatCubit>().sendMessage(),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Assets.svgs.documentUpload.svg(),
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    shape: WidgetStateProperty.all(
                      const CircleBorder(),
                    ),
                  ),
                  onPressed: () async {
                    await context.read<ChatCubit>().pickFiles();
                  },
                ),
                IconButton(
                  icon: Assets.svgs.sendIcon.svg(),
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    shape: WidgetStateProperty.all(
                      const CircleBorder(),
                    ),
                  ),
                  onPressed: () => context.read<ChatCubit>().sendMessage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
