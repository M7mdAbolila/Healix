import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';

import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/shadows_manager.dart';

class CircleBotLogo extends StatelessWidget {
  const CircleBotLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.h,
      width: 104.w,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          ShadowsManager.softShadow(),
        ],
      ),
      child: Assets.svgs.mainLogo.svg(),
    );
  }
}
