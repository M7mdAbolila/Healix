import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class AboutDoctorSection extends StatelessWidget {
  const AboutDoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About the Doctor',
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkerGreyText,
          ),
        ),
        Text(
          'Lorem ipsum dolor sit amet consectetur. Ridiculus congue sapien ut fermentum. Mi pulvinar scelerisque lectus convallis mauris amet etiam adipiscing turpis. Hendrerit id amet cras lacus erat.',
          style: AppTextStyles.fontBodyText(
            color: ColorsManager.darkerGreyText,
          ),
        ),
      ],
    );
  }
}
