import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/features/chat_bot/presentation/widgets/circle_bot_logo.dart';
import 'package:healix/features/chat_bot/presentation/widgets/header_bar_tutorial.dart';
import 'package:healix/features/chat_bot/presentation/widgets/previous_discussions_section.dart';

import '../../../../core/widgets/my_divider_widget.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderBarTutorial(),
          verticalSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const CircleBotLogo(),
                verticalSpace(16),
                const MyDividerWidget(),
                verticalSpace(12),
                const PreviousDiscussionsSection(),
                verticalSpace(12),
                const MyDividerWidget(),
                verticalSpace(12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
