import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/routing/routes.dart';
import 'package:healix/features/chat_bot/domain/entities/chat_entity.dart';
import 'package:healix/features/chat_bot/presentation/logic/all_chats_cubit/all_chats_cubit.dart';

import '../../../../../core/functions/convert_and_parse_messages.dart';
import '../../../../../core/theming/colors_manager.dart';

class PreviousDiscussionsCard extends StatelessWidget {
  final ChatEntity chat;

  const PreviousDiscussionsCard({
    super.key,
    required this.chat,
  });

  String _formatDateTime(String dateTimeString) {
    try {
      final dateTime = DateTime.parse(dateTimeString);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays > 0) {
        return '${difference.inDays}d ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours}h ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes}m ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return 'Recently';
    }
  }

  String _getPreviewText() {
    // Get the first user message for preview
    final userMessages = chat.messages.where((msg) => msg.isUser).toList();
    if (userMessages.isNotEmpty) {
      return userMessages.first.content;
    }
    return 'No messages';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Convert chat messages to domain messages using the repository
        final convertedMessages = convertChatMessagesToMessages(chat.messages);

        context.pushNamed(
          Routes.chatScreen,
          arguments: {
            'chatId': chat.id,
            'messages': convertedMessages,
          },
        ).then((_) {
          context.read<AllChatsCubit>().refreshChats();
        });
      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: ColorsManager.lightGreyText,
          ),
        ),
        child: Row(
          spacing: 8.w,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                spacing: 8.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getPreviewText(),
                    style: AppTextStyles.fontBodyText(
                      color: ColorsManager.darkerGreyText,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    _formatDateTime(chat.createdAt),
                    style: AppTextStyles.fontParagraphText(
                      color: ColorsManager.darkGreyText,
                    ),
                  ),
                ],
              ),
            ),
            Assets.svgs.rightArrow.svg(
              height: 24.h,
              width: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
