import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/chat_screen_widgets/chat_header_widget.dart';
import '../widgets/chat_screen_widgets/chat_text_field_container.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                const ChatHeaderWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: const Column(
                    children: [],
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: ChatTextFieldContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
