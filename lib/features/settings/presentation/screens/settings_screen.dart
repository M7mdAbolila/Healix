import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';
import 'package:healix/features/settings/presentation/widgets/setting_button.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../main_layout/presentation/logic/navigation_cubit/navigation_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with AutomaticKeepAliveClientMixin<SettingsScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: [
          CustomScreenAppBar(
            title: 'Settings',
            onBackTap: () => context.read<NavigationCubit>().previousPage(),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
              child: Column(
                children: [
                  SettingButton(
                      title: 'Mangage Account',
                      iconPath: Assets.svgs.navProfile2.path),
                  SettingButton(
                      title: 'Physical Info', iconPath: Assets.svgs.edit.path),
                  SettingButton(
                      title: 'My Family', iconPath: Assets.svgs.people.path),
                  SettingButton(
                      title: 'FAQ', iconPath: Assets.svgs.messageQuestion.path),
                  SettingButton(
                      title: 'Logout', iconPath: Assets.svgs.logoutBlue.path),
                  const Spacer(),
                  Assets.svgs.logoWithWord.svg(height: 70.h, width: 120.w),
                  verticalSpace(8),
                  Text(
                    'Smarter Health, Safer Future!',
                    style: AppTextStyles.fontBodyText(
                      color: ColorsManager.grey700,
                    ),
                  ),
                  verticalSpace(8),
                  Row(
                    spacing: 24.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.svgs.facebookLogo.svg(),
                      Assets.svgs.instgramLogo.svg(),
                      Assets.svgs.linkedInLogo.svg(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
