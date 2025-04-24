import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/features/home/presentation/widgets/featured_doctor_list_view.dart';
import 'package:healix/features/home/presentation/widgets/chat_with_healix_card.dart';
import 'package:healix/features/home/presentation/widgets/just_talk_to_healix_card.dart';
import '../../../../core/theming/colors.dart';
import 'home_features_buttons_row.dart';

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                const ChatWithHealixCard(),
                verticalSpace(4),
                Divider(
                  thickness: 2.h,
                  color: ColorsManager.lightGreyText,
                  indent: 16.w,
                  endIndent: 16.w,
                ),
                verticalSpace(4),
                const HomeFeaturesButtonsRow(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: const FeaturedDoctorListView(),
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: const JustTalkToHealixCard(),
          ),
          verticalSpace(32),
        ],
      ),
    );
  }
}
