import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/features/chat_bot/presentation/widgets/main_chat_bot_screen_widgets/circle_bot_logo.dart';
import 'package:healix/features/chat_bot/presentation/widgets/main_chat_bot_screen_widgets/header_bar_tutorial.dart';
import 'package:healix/features/chat_bot/presentation/widgets/main_chat_bot_screen_widgets/previous_discussions_section.dart';
import 'package:healix/core/di/setup_get_it.dart';

import '../../../../core/widgets/feature_title_text.dart';
import '../../../../core/widgets/my_divider_widget.dart';
import '../widgets/main_chat_bot_screen_widgets/new_chat_button.dart';
import '../logic/all_chats_cubit/all_chats_cubit.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AllChatsCubit>()..getAllChats(),
      child: Scaffold(
        bottomNavigationBar: const NewChatButton(),
        body: Column(
          children: [
            const HeaderBarTutorial(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    verticalSpace(20),
                    const CircleBotLogo(),
                    verticalSpace(16),
                    const MyDividerWidget(),
                    verticalSpace(12),
                    const FeatureTitleText(title: 'Previous Discussions'),
                    verticalSpace(8),
                    const PreviousDiscussionsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
