import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/features/sign_up/presentation/logic/sign_up_cubit/sign_up_cubit.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/text_styles.dart';

class ChooseProfileSection extends StatelessWidget {
  const ChooseProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.watch<SignUpCubit>().profilePhoto != null
            ? ClipOval(
                child: Image.file(
                  context.watch<SignUpCubit>().profilePhoto!,
                  height: 98.h,
                  width: 98.w,
                  fit: BoxFit.cover,
                ),
              )
            : Assets.svgs.consultDoc.svg(
                height: 98.h,
                width: 98.w,
              ),
        verticalSpace(16),
        GestureDetector(
          onTap: () => context.read<SignUpCubit>().pickProfileImage(),
          child: Container(
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
        ),
      ],
    );
  }
}
