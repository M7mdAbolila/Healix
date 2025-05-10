import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import 'show_confirm_booking_dialog.dart';

class AvailableSlotsList extends StatelessWidget {
  const AvailableSlotsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(8.r),
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: ColorsManager.dimmedColor,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: ColorsManager.lightGreyText),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: ColorsManager.orange10,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'Today\n11/1',
                textAlign: TextAlign.center,
                style: AppTextStyles.fontSmallerText(
                  color: ColorsManager.blue100,
                ),
              ),
            ),
            Text(
              '4:00 PM',
              textAlign: TextAlign.center,
              style: AppTextStyles.fontSmallerText(
                color: ColorsManager.darkerGreyText,
              ),
            ),
            Text(
              'To',
              textAlign: TextAlign.center,
              style: AppTextStyles.fontSmallerText(
                color: ColorsManager.darkerGreyText,
              ),
            ),
            Text(
              '11:00 PM',
              textAlign: TextAlign.center,
              style: AppTextStyles.fontSmallerText(
                color: ColorsManager.darkerGreyText,
              ),
            ),
            CustomButton(
              width: 66.w,
              title: 'Book',
              textStyle: AppTextStyles.fontTextInput(
                color: Colors.white,
              ),
              onTap: () {
                showConfirmBookingDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
