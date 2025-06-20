import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:intl/intl.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../domain/entities/message.dart';
import 'observations_widget.dart';
import 'options_widget.dart';
import 'file_chip_widget.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final Function(String) onOptionSelected;

  const MessageBubble({
    super.key,
    required this.message,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(
          (message.options != null && message.options!.isNotEmpty) ||
                  message.hasObservations && message.observations != null
              ? 16.r
              : 8.r,
        ),
        margin: EdgeInsets.fromLTRB(
          message.isUser ? 40.w : 16.w,
          8.h,
          message.isUser ? 16.w : 40.w,
          8.h,
        ),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.white : ColorsManager.botMessageColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(message.isUser ? 16.r : 0.r),
            topRight: Radius.circular(message.isUser ? 0.r : 16.r),
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
          border: const Border(
            bottom: BorderSide(
              color: ColorsManager.blue100,
            ),
          ),
        ),
        child: Column(
          spacing: 8.h,
          crossAxisAlignment: message.isUser
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            MarkdownBody(
              data: message.message,
              styleSheet: MarkdownStyleSheet(
                p: AppTextStyles.fontBodyText(
                  color: message.isUser
                      ? ColorsManager.grey800
                      : ColorsManager.blue100,
                ),
                h1: AppTextStyles.fontTitleText(
                  color: message.isUser
                      ? ColorsManager.grey800
                      : ColorsManager.blue100,
                ),
                h2: AppTextStyles.fontHeaderText(
                  color: message.isUser
                      ? ColorsManager.grey800
                      : ColorsManager.blue100,
                ),
                strong: AppTextStyles.fontTextInput(
                  color: message.isUser
                      ? ColorsManager.grey800
                      : ColorsManager.blue100,
                ),
                listBullet: AppTextStyles.fontParagraphText(
                  color: message.isUser
                      ? ColorsManager.grey800
                      : ColorsManager.blue100,
                ),
              ),
            ),
            if (message.files != null && message.files!.isNotEmpty)
              Wrap(
                spacing: 4.w,
                runSpacing: 4.h,
                children: message.files!
                    .map((fileName) => FileChipWidget(
                          fileName: fileName,
                          isInMessage: true,
                          isUserMessage: message.isUser,
                        ))
                    .toList(),
              ),
            if (message.options != null && message.options!.isNotEmpty)
              OptionsWidget(
                options: message.options,
                onOptionSelected: onOptionSelected,
              ),
            if (message.hasObservations && message.observations != null)
              ObservationsWidget(
                observations: message.observations,
              ),
            Text(
              DateFormat.jm().format(message.date),
              style: AppTextStyles.fontSmallerText(
                color: message.isUser
                    ? ColorsManager.grey500
                    : ColorsManager.grey700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
