import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/dialogs/setup_dialog.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/features/sign_up/presentation/screens/physical_info_screen.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../logic/sign_up_cubit/sign_up_cubit.dart';

class CreateProfileButton extends StatelessWidget {
  const CreateProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          title: 'Next',
          onTap: () {
            final cubit = context.read<SignUpCubit>();
            if (cubit.locationLat.isNullOrEmpty() ||
                cubit.locationLong.isNullOrEmpty()) {
              showAwesomeSnackbar(context,
                  title: 'Location Error',
                  message: 'Please select your address',
                  isWarning: true);
            } else if (cubit.createProfileFormKey.currentState!.validate()) {
              showLoadingDialog(context);
              Future.delayed(const Duration(seconds: 1), () {
                context.pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider<SignUpCubit>.value(
                        value: cubit,
                        child: const PhysicalInfoScreen(),
                      );
                    },
                  ),
                );
              });
            }
          },
        ),
      ),
    );
  }
}
