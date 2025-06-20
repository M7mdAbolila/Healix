import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/routing/routes.dart';
import 'package:healix/core/theming/shadows_manager.dart';
import 'package:healix/core/widgets/custom_button.dart';

class NewChatButton extends StatelessWidget {
  const NewChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r),
        ),
        boxShadow: [
          ShadowsManager.upwardShadow(),
        ],
      ),
      child: CustomButton(
        height: 40.h,
        title: 'New Chat',
        onTap: () => context.pushNamed(Routes.chatScreen),
      ),
    );
  }
}
