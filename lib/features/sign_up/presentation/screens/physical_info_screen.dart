import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/features/sign_up/presentation/widgets/physical_info/done_button.dart';
import 'package:healix/features/sign_up/presentation/widgets/sign_up/sign_up_bloc_listener.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_linear_progress.dart';
import '../widgets/physical_info/physical_info_from.dart';
import '../widgets/physical_info/profile_photo_and_back_button.dart';

class PhysicalInfoScreen extends StatelessWidget {
  const PhysicalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                verticalSpace(50),
                const ProfilePhotoAndBackButton(),
                verticalSpace(16),
                const CustomLinearProgress(
                  value: 0.75,
                ),
                verticalSpace(16),
                Text(
                  'Physical Information',
                  style: AppTextStyles.fontTitleText(
                    color: ColorsManager.darkerGreyText,
                  ),
                ),
                verticalSpace(36),
                const PhysicalInfoFrom(),
                verticalSpace(36),
                const DoneButton(),
                const SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
