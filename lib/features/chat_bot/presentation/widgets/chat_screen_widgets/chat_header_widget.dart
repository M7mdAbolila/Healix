import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/widgets/white_back_button.dart';

import '../../../../../core/theming/colors_manager.dart';

class ChatHeaderWidget extends StatelessWidget {
  const ChatHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 56.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8.r),
        ),
      ),
      child: Row(
        spacing: 16.w,
        children: [
          const WhiteBackButton(),
          Assets.svgs.healixName.svg(
            height: 32.h,
            width: 137.w,
          ),
        ],
      ),
    );
  }
}
