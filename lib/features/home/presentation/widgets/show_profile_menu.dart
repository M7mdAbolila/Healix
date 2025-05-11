import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import 'profile_menu_button.dart';

Future<dynamic> showProfileMenu(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      spacing: 12.w,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: EdgeInsets.all(2.r),
                            decoration: BoxDecoration(
                              color: ColorsManager.grey400,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.close_rounded,
                              color: ColorsManager.darkGreyText,
                              size: 20.sp,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Profile Options',
                              style: AppTextStyles.fontTitleText(
                                color: ColorsManager.darkerGreyText,
                              ),
                            ),
                            verticalSpace(8),
                            Text(
                              'Ahmed Essam',
                              style: AppTextStyles.fontBodyText(
                                color: ColorsManager.darkerGreyText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(16),
                    ProfileMenuButton(
                      title: 'Edit Your Profile',
                      iconPath: Assets.svgs.navProfile2.path,
                    ),
                    ProfileMenuButton(
                      title: 'Physical Info',
                      iconPath: Assets.svgs.edit.path,
                    ),
                    ProfileMenuButton(
                      title: 'My Family',
                      iconPath: Assets.svgs.people.path,
                    ),
                    ProfileMenuButton(
                      title: 'Settings',
                      iconPath: Assets.svgs.navSetting2.path,
                    ),
                    ProfileMenuButton(
                      title: 'Logout',
                      iconPath: Assets.svgs.logoutBlue.path,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -15.h,
                right: -10.w,
                child: Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 10.w),
                    image: DecorationImage(
                      image: AssetImage(Assets.images.temp.path),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
