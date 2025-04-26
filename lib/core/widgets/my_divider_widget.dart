import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors_manager.dart';

class MyDividerWidget extends StatelessWidget {
  const MyDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 2.h,
      color: ColorsManager.lightGreyText,
      indent: 12.w,
      endIndent: 12.w,
    );
  }
}
