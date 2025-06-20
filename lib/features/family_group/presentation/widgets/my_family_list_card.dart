import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/routing/routes.dart';
import '../../data/models/family_group_model.dart';

class MyFamilyListCard extends StatelessWidget {
  const MyFamilyListCard({super.key, this.familyGroup});
  final FamilyGroupModel? familyGroup;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.familyGroupMembersScreen,
        arguments: familyGroup,
      ),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: ColorsManager.lightGreyText,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Family\'s List',
                  style: AppTextStyles.fontBodyText(
                    color: ColorsManager.darkerGreyText,
                  ),
                ),
                Text(
                  familyGroup?.code ?? 'Family Code',
                  style: AppTextStyles.fontBodyText(
                    color: ColorsManager.darkGreyText,
                  ),
                ),
                Text(
                  '${familyGroup?.members?.length ?? 0} Members',
                  style: AppTextStyles.fontBodyText(
                    color: ColorsManager.darkGreyText,
                  ),
                ),
              ],
            ),
            Assets.svgs.familyListIcon.svg(
              width: 80.w,
              height: 80.h,
            ),
          ],
        ),
      ),
    );
  }
}
