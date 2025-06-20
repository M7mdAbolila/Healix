import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/di/setup_get_it.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/routing/routes.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/features/home/presentation/screens/home_screen.dart';
import 'package:healix/features/medical_history/presentation/screens/medical_history_screen.dart';
import 'package:healix/features/my_activity/presentation/screens/my_activity_screen.dart';
import 'package:healix/features/settings/presentation/screens/settings_screen.dart';

import '../../../../core/gen/assets.gen.dart';
import '../logic/navigation_cubit/navigation_cubit.dart';
import '../logic/navigation_cubit/navigation_state.dart';
import '../widgets/custom_nav_bar/custom_nav_bar.dart';
import '../widgets/custom_nav_bar/nav_button.dart';

class HealixMainLayoutScreen extends StatelessWidget {
  const HealixMainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NavigationCubit>(),
      child: const _HealixMainLayoutView(),
    );
  }
}

class _HealixMainLayoutView extends StatefulWidget {
  const _HealixMainLayoutView();

  @override
  State<_HealixMainLayoutView> createState() => _HealixMainLayoutViewState();
}

class _HealixMainLayoutViewState extends State<_HealixMainLayoutView> {
  void _onTabChanged(int index) {
    context.read<NavigationCubit>().changeTab(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final selectedIndex = context.read<NavigationCubit>().selectedIndex;

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
              onPressed: () => context.pushNamed(Routes.mainChatBotScreen),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomNavBar(
            selectedIndex: selectedIndex,
            onTabChange: _onTabChanged,
            tabs: [
              NavButton(
                title: 'Home',
                unactiveWidget:
                    Assets.svgs.navHome1.svg(height: 32.h, width: 32.w),
                activeWidget:
                    Assets.svgs.navHome2.svg(height: 32.h, width: 32.w),
              ),
              NavButton(
                title: 'Medic Hist.',
                unactiveWidget:
                    Assets.svgs.navMedicalHist1.svg(height: 32.h, width: 32.w),
                activeWidget:
                    Assets.svgs.navMedicalHist2.svg(height: 32.h, width: 32.w),
              ),
              NavButton(
                title: 'My Activity',
                unactiveWidget:
                    Assets.svgs.navMyActivity1.svg(height: 32.h, width: 32.w),
                activeWidget:
                    Assets.svgs.navMyActivity2.svg(height: 32.h, width: 32.w),
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
            controller: context.watch<NavigationCubit>().pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              context.read<NavigationCubit>().changeTab(index);
            },
            children: const [
              HomeScreen(),
              MedicalHistoryScreen(),
              MyActivityScreen(),
              SettingsScreen(),
            ],
          ),
        );
      },
    );
  }
}
