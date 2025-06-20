import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

import '../widgets/login_form_container.dart';
import '../widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: ColorsManager.authBackground,
        body: Stack(
          children: [
            _buildBackgroundImage(),
            _buildContent(),
            const LoginBlocListener(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Assets.images.authPicture.image(
      width: double.infinity,
      height: 360.h,
      fit: BoxFit.cover,
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.only(top: 90.h),
      child: Column(
        children: [
          _buildLogo(),
          verticalSpace(8),
          _buildSubtitle(),
          verticalSpace(32),
          const Expanded(
            child: LoginFormContainer(),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Assets.svgs.whiteLogoWithWord.svg(
      width: 162.w,
      height: 93.h,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'Smarter Health, Safer Future!',
      style: AppTextStyles.fontBodyText(color: Colors.white),
    );
  }
}
