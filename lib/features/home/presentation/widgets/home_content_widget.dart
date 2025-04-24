import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/home/presentation/widgets/chat_with_healix_card.dart';


class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: const Column(
          children: [
            ChatWithHealixCard(),
            
          ],
        ),
      ),
    );
  }
}
