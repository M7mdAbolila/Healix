import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/theming/colors_manager.dart';
import 'show_profile_menu.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 56.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 16),
            blurRadius: 13,
            spreadRadius: -8,
          ),
        ],
      ),
      child: Column(
        spacing: 24.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Assets.svgs.healixName.svg(
                height: 32.h,
                width: 137.w,
              ),
              GestureDetector(
                onTap: () => showProfileMenu(context),
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2.w),
                  ),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: userProfileImage,
                      height: 40.h,
                      width: 40.w,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(
                        strokeWidth: 2.w,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            ColorsManager.primaryColor),
                      ),
                      errorWidget: (context, url, error) =>
                          Assets.svgs.consultDoc.svg(
                        height: 40.h,
                        width: 40.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // const SearchBarWidget(padding: EdgeInsets.zero),
        ],
      ),
    );
  }
}
