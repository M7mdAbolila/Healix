import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/features/login/presentation/widgets/login_bloc_listener.dart';
import '../widgets/login_form_container.dart';

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
            _buildLoginBackgroundImage(),
            _buildBodyContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginBackgroundImage() {
    return Assets.images.authPicture.image(
      width: double.infinity,
      height: 360.h,
      fit: BoxFit.cover,
    );
  }

  Widget _buildBodyContent() {
    return Padding(
      padding: EdgeInsets.only(top: 90.h),
      child: Column(
        children: [
          Assets.svgs.whiteLogoWithWord.svg(
            width: 162.w,
            height: 93.h,
          ),
          verticalSpace(8),
          Text(
            'Smarter Health, Safer Future!',
            style: AppTextStyles.fontBodyText(color: Colors.white),
          ),
          verticalSpace(32),
          const Expanded(
            child: LoginFormContainer(),
          ),
          const LoginBlocListener(),
        ],
      ),
    );
  }
}
