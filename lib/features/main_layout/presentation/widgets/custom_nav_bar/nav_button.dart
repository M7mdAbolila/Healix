import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/text_styles.dart';

import '../../../../../core/theming/colors_manager.dart';

class NavButton extends StatelessWidget {
  final String? title;
  final Widget activeWidget;
  final Widget unactiveWidget;
  final bool active;
  final VoidCallback? onPressed;

  const NavButton({
    super.key,
    this.title,
    required this.activeWidget,
    required this.unactiveWidget,
    this.active = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: active
                ? SizedBox(
                    key: const ValueKey("active"),
                    height: 32.h,
                    width: 32.w,
                    child: activeWidget,
                  )
                : SizedBox(
                    key: const ValueKey("inactive"),
                    height: 32.h,
                    width: 32.w,
                    child: unactiveWidget,
                  ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutBack,
            height: 2.h,
            width: 16.w,
            decoration: BoxDecoration(
              color: active ? ColorsManager.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          if (title != null)
            Text(
              title!,
              style: AppTextStyles.fontSmallerText(
                color: active
                    ? ColorsManager.primaryColor
                    : ColorsManager.darkGreyText,
              ),
            ),
        ],
      ),
    );
  }
}
