import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/theming/colors_manager.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class ChatTextFieldContainer extends StatefulWidget {
  const ChatTextFieldContainer({
    super.key,
    required this.controller,
    required this.onSend,
  });
  final TextEditingController controller;
  final VoidCallback onSend;

  @override
  State<ChatTextFieldContainer> createState() => _ChatTextFieldContainerState();
}

class _ChatTextFieldContainerState extends State<ChatTextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r),
        ),
      ),
      child: CustomTextFormField(
        hintText: 'Type here...',
        controller: widget.controller,
        onSumitted: (_) => widget.onSend(),
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
              onPressed: () async {},
            ),
            IconButton(
              icon: Assets.svgs.sendIcon.svg(),
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(
                  const CircleBorder(),
                ),
              ),
              onPressed: widget.onSend,
            ),
          ],
        ),
      ),
    );
  }
}
