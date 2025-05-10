import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class ClincContainer extends StatelessWidget {
  const ClincContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 16.w,
      ),
      color: ColorsManager.dimmedColor,
      child: Text(
        'Katameya Clinic',
        style: AppTextStyles.fontBodyText(
          color: ColorsManager.darkerGreyText,
        ),
      ),
    );
  }
}
