import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/widgets/grey_back_button.dart';
import 'package:healix/features/sign_up/presentation/widgets/create_profile/add_address_card.dart';
import 'package:healix/features/sign_up/presentation/widgets/create_profile/create_profile_form.dart';

import '../../../../core/widgets/custom_linear_progress.dart';
import '../widgets/create_profile/choose_profile_section.dart';
import '../widgets/create_profile/create_profile_button.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    verticalSpace(50),
                    _buildBackButton(),
                    verticalSpace(20),
                    const CustomLinearProgress(
                      value: 0.25,
                    ),
                    verticalSpace(8),
                    Column(
                      children: [
                        _buildTitleWidget(),
                        verticalSpace(40),
                        const ChooseProfileSection(),
                        verticalSpace(16),
                        const CreateProfileForm(),
                        verticalSpace(24),
                        const AddAddressCard(),
                        verticalSpace(150),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              const CreateProfileButton(),
          ],
        ),
      ),
    );
  }

  Text _buildTitleWidget() {
    return Text(
      'Create your profile',
      style: AppTextStyles.fontTitleText(
        color: ColorsManager.darkerGreyText,
      ),
    );
  }

  Align _buildBackButton() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: GreyBackButton(),
    );
  }
}
