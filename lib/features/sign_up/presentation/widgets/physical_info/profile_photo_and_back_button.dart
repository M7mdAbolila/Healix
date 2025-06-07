import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/widgets/grey_back_button.dart';
import '../../logic/sign_up_cubit/sign_up_cubit.dart';

class ProfilePhotoAndBackButton extends StatelessWidget {
  const ProfilePhotoAndBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const GreyBackButton(),
        context.read<SignUpCubit>().profilePhoto != null
            ? ClipOval(
                child: Image.file(
                  context.read<SignUpCubit>().profilePhoto!,
                  height: 56.h,
                  width: 56.w,
                  fit: BoxFit.cover,
                ),
              )
            : Assets.svgs.consultDoc.svg(
                height: 56.h,
                width: 56.w,
              ),
      ],
    );
  }
}
