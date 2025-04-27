import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/widgets/feature_title_text.dart';
import 'package:healix/core/widgets/view_all_button.dart';
import 'package:healix/features/chat_bot/presentation/widgets/main_chat_bot_screen_widgets/previous_discussions_card.dart';

class PreviousDiscussionsSection extends StatelessWidget {
  const PreviousDiscussionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FeatureTitleText(title: 'Previous Discussions'),
            ViewAllButton(onTap: () {}),
          ],
        ),
        const PreviousDiscussionsCard(),
      ],
    );
  }
}
