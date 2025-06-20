import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/shadows_manager.dart';

import 'nav_button.dart';

class CustomNavBar extends StatelessWidget {
  final List<NavButton> tabs;
  final int selectedIndex;
  final ValueChanged<int>? onTabChange;

  const CustomNavBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r),
        ),
        boxShadow: [
          ShadowsManager.upwardShadow(),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...tabs.sublist(0, 2).asMap().entries.map((entry) {
            final index = entry.key;
            final tab = entry.value;
            return NavButton(
              key: tab.key,
              title: tab.title,
              activeWidget: tab.activeWidget,
              unactiveWidget: tab.unactiveWidget,
              active: selectedIndex == index,
              onPressed: () => onTabChange?.call(index),
            );
          }),

          /// space for FAB
          SizedBox(width: 24.w),

          ...tabs.sublist(2).asMap().entries.map((entry) {
            final index = entry.key + 2;
            final tab = entry.value;
            return NavButton(
              key: tab.key,
              title: tab.title,
              activeWidget: tab.activeWidget,
              unactiveWidget: tab.unactiveWidget,
              active: selectedIndex == index,
              onPressed: () => onTabChange?.call(index),
            );
          }),
        ],
      ),
    );
  }
}
