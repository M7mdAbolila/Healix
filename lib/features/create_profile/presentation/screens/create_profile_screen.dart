import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/theming/colors.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/features/create_profile/presentation/widgets/add_address_card.dart';
import 'package:healix/features/create_profile/presentation/widgets/create_profile_form.dart';

import '../../../../core/widgets/custom_button.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  verticalSpace(50),
                  _buildLogoutButton(),
                  verticalSpace(16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildTitleWidget(),
                          verticalSpace(40),
                          _buildProfilePhotoSection(),
                          verticalSpace(16),
                          const CreateProfileForm(),
                          verticalSpace(24),
                          const AddAddressCard(),
                          verticalSpace(150),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildDoneButton(),
          ],
        ),
      ),
    );
  }

  Align _buildDoneButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.fromLTRB(16.w, 80.h, 16.w, 32.h),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(8, 255, 255, 255),
              Color.fromARGB(195, 255, 255, 255),
              Colors.white,
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: CustomButton(
          height: 40.h,
          title: 'Done',
          onTap: () {
            
          },
        ),
      ),
    );
  }

  Widget _buildProfilePhotoSection() {
    return Column(
      children: [
        ClipOval(
          child: Assets.images.temp.image(
            height: 98.h,
            width: 98.w,
          ),
        ),
        verticalSpace(16),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 16.w,
          ),
          decoration: BoxDecoration(
            color: ColorsManager.grey200,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            'Profile Photo',
            style: AppTextStyles.fontParagraphText(
              color: ColorsManager.darkGreyText,
            ),
          ),
        ),
      ],
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

  Align _buildLogoutButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        spacing: 8.h,
        children: [
          Assets.svgs.logout.svg(),
          Text(
            'Logout',
            style: AppTextStyles.fontSmallerText(
              color: ColorsManager.grey500,
            ),
          ),
        ],
      ),
    );
  }
}
