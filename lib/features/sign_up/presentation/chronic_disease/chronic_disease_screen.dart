import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/theming/colors_manager.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/grey_back_button.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_linear_progress.dart';

class ChronicDiseaseScreen extends StatelessWidget {
  const ChronicDiseaseScreen({super.key});

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
                _buildBackButtonAndPhoto(),
                verticalSpace(16),
                const CustomLinearProgress(
                  value: 0.75,
                ),
                verticalSpace(16),
                Assets.svgs.chronicDisease.svg(
                  width: 180.w,
                  height: 135.h,
                ),
                verticalSpace(32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Do you have any chronic disease?',
                    style: AppTextStyles.fontTextInput(
                      color: ColorsManager.darkerGreyText,
                    ),
                  ),
                ),
                verticalSpace(16),
                CustomButton(
                  title: 'Done',
                  onTap: () => context.pushNamed(Routes.addMidcalHistScreen),
                ),
                verticalSpace(16),
                CustomButton(
                  title: 'No, Skip',
                  backgroundColor: ColorsManager.lightGreyText,
                  textColor: ColorsManager.grey700,
                  onTap: () => context.pushNamed(Routes.addMidcalHistScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildBackButtonAndPhoto() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const GreyBackButton(),
        ClipOval(
          child: Assets.images.temp.image(
            height: 56.h,
            width: 56.w,
          ),
        ),
      ],
    );
  }
}
