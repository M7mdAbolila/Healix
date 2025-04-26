import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/features/sign_up/presentation/create_profile/widgets/text_field_with_prefix_text.dart';
import 'package:healix/features/sign_up/presentation/physical_info/widgets/choose_gender_drop_down.dart';
import 'package:healix/features/sign_up/presentation/physical_info/widgets/date_of_birth_widget.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../../core/widgets/grey_back_button.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_linear_progress.dart';

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
                Row(
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
                ),
                verticalSpace(16),
                const CustomLinearProgress(
                  value: 0.5,
                ),
                verticalSpace(16),
                Text(
                  'Physical Information',
                  style: AppTextStyles.fontTitleText(
                    color: ColorsManager.darkerGreyText,
                  ),
                ),
                verticalSpace(96),
                const DateOfBirthWidget(),
                verticalSpace(16),
                const TextFieldWithPrifixText(
                  title: 'Height',
                  hintText: 'How tall are you?',
                  prefixText: 'CM',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                verticalSpace(16),
                const TextFieldWithPrifixText(
                  title: 'Weight',
                  hintText: 'Your current weight',
                  prefixText: 'K.G.',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                ),
                verticalSpace(16),
                Stack(
                  children: [
                    Column(
                      children: [
                        verticalSpace(170),
                        CustomButton(
                          title: 'Done',
                          onTap: () =>
                              context.pushNamed(Routes.chronicDiseaseScreen),
                        ),
                      ],
                    ),
                    const ChooseGenderDropDown(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
