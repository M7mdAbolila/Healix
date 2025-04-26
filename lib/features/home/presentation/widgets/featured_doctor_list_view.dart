import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/widgets/feature_title_text.dart';
import 'package:healix/features/home/presentation/widgets/Featured_doctor_item.dart';

class FeaturedDoctorListView extends StatelessWidget {
  const FeaturedDoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FeatureTitleText(title: 'Featured Doctors'),
        SizedBox(
          height: 268.h,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const FeaturedDoctorItem(),
          ),
        ),
      ],
    );
  }
}
