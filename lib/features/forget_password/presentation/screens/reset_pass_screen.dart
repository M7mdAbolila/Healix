import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/reset_password_form.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
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
                      _buildProfilePhotoWidget(),
                      verticalSpace(65),
                      const ResetPasswordForm(),
                      verticalSpace(200),
                      CustomButton(
                        height: 40.h,
                        title: 'Save & Continue',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePhotoWidget() {
    return ClipOval(
      child: Assets.images.temp.image(
        height: 98.h,
        width: 98.w,
      ),
    );
  }

  Text _buildTitleWidget() {
    return Text(
      'Reset Your Password',
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
