import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/theming/colors_manager.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../state_management/chat_cubit/chat_bot_cubit.dart';
import '../../state_management/chat_cubit/chat_bot_state.dart';

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
          BlocBuilder<ChatBotCubit, ChatBotState>(
            builder: (context, state) {
              final cubit = context.read<ChatBotCubit>();
              if (state is ChatBotFilesSelected) {
                return _buildSelectedFilesWidget(cubit, state.selectedFiles);
              }
              return const SizedBox.shrink();
            },
          ),
          CustomTextFormField(
            hintText: 'Type here...',
            controller: context
                .read<ChatBotCubit>()
                .formManager
                .messageController
                .controller,
            onFieldSubmit: (_) => context.read<ChatBotCubit>().sendMessage(),
            validator: context.read<ChatBotCubit>().validateMessage,
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
                    await context.read<ChatBotCubit>().pickFiles();
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
                  onPressed: () => context.read<ChatBotCubit>().sendMessage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedFilesWidget(
      ChatBotCubit cubit, List<String> selectedFiles) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${selectedFiles.length} file(s) selected',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              ),
              TextButton(
                onPressed: cubit.clearSelectedFiles,
                child: Text(
                  'Clear All',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 4.w,
            runSpacing: 4.h,
            children: selectedFiles
                .map((fileName) => Chip(
                      label: Text(
                        fileName,
                        style: TextStyle(fontSize: 10.sp),
                      ),
                      deleteIcon: const Icon(Icons.close, size: 16),
                      onDeleted: () {
                        // Find the file and remove it
                        final fileToRemove = cubit.selectedFiles
                            .where((f) => f.path.split('/').last == fileName)
                            .firstOrNull;
                        if (fileToRemove != null) {
                          cubit.removeFile(fileToRemove);
                        }
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
