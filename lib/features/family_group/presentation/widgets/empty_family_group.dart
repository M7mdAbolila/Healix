import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../widgets/family_name_and_code_column.dart';
import '../widgets/create_family_group_dialog.dart';
import '../widgets/find_family_group_dialog.dart';

class EmptyFamilyGroup extends StatelessWidget {
  const EmptyFamilyGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const FamilyNameAndCodeColumn(),
        _buildCard(
          'Create New Family Group',
          Assets.svgs.addSquare.path,
          () => showCreateFamilyGroupDialog(context),
        ),
        _buildCard(
          'Join Family Group',
          Assets.svgs.familyListIcon.path,
          () => showFindFamilyGroupDialog(context),
        ),
      ],
    );
  }

  Widget _buildCard(String title, String iconPath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
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
                  title,
                  style: AppTextStyles.fontBodyText(
                    color: ColorsManager.darkerGreyText,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              iconPath,
              width: 65.w,
              height: 65.h,
            ),
          ],
        ),
      ),
    );
  }
}
