import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/theming/colors_manager.dart';
import '../widgets/family_name_and_code_column.dart';
import '../widgets/my_family_list_card.dart';

class LoadingFamilyGroup extends StatelessWidget {
  const LoadingFamilyGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: const PulseEffect(
        from: ColorsManager.grey400,
        to: ColorsManager.grey200,
      ),
      child: Column(
        spacing: 24.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          FamilyNameAndCodeColumn(),
          MyFamilyListCard(),
        ],
      ),
    );
  }
}
