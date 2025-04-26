import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/routing/routes.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/features/home/presentation/screens/home_screen.dart';
import 'package:healix/features/medical_history/presentation/screens/medical_history_screen.dart';
import 'package:healix/features/my_activity/presentation/screens/my_activity_screen.dart';
import 'package:healix/features/settings/presentation/screens/settings_screen.dart';

import '../../../../core/gen/assets.gen.dart';
import '../widgets/custom_nav_bar/custom_nav_bar.dart';
import '../widgets/custom_nav_bar/nav_button.dart';

class HealixMainLayoutScreen extends StatefulWidget {
  const HealixMainLayoutScreen({super.key});

  @override
  State<HealixMainLayoutScreen> createState() => _HealixMainLayoutScreenState();
}

class _HealixMainLayoutScreenState extends State<HealixMainLayoutScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 24.h),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: ColorsManager.primaryColor,
          child: Assets.svgs.mainLogo.svg(
            height: 26.h,
            width: 26.w,
          ),
          onPressed: () => context.pushNamed(Routes.chatBotScreen),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChanged,
        tabs: [
          NavButton(
            title: 'Home',
            unactiveWidget: Assets.svgs.navHome1.svg(height: 32.h, width: 32.w),
            activeWidget: Assets.svgs.navHome2.svg(height: 32.h, width: 32.w),
          ),
          NavButton(
            title: 'Medic Hist.',
            unactiveWidget:
                Assets.svgs.navActivity1.svg(height: 32.h, width: 32.w),
            activeWidget:
                Assets.svgs.navActivity2.svg(height: 32.h, width: 32.w),
          ),
          NavButton(
            title: 'Profile',
            unactiveWidget:
                Assets.svgs.navProfile1.svg(height: 32.h, width: 32.w),
            activeWidget:
                Assets.svgs.navProfile2.svg(height: 32.h, width: 32.w),
          ),
          NavButton(
            title: 'Settings',
            unactiveWidget:
                Assets.svgs.navSetting1.svg(height: 32.h, width: 32.w),
            activeWidget:
                Assets.svgs.navSetting2.svg(height: 32.h, width: 32.w),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: _onTabChanged,
        children: const [
          HomeScreen(),
          MedicalHistoryScreen(),
          MyActivityScreen(),
          SettingsScreen(),
        ],
      ),
    );
  }
}
