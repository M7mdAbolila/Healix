import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/widgets/white_back_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theming/colors_manager.dart';

class HeaderBarTutorial extends StatefulWidget {
  const HeaderBarTutorial({super.key});

  @override
  State<HeaderBarTutorial> createState() => _HeaderBarTutorialState();
}

class _HeaderBarTutorialState extends State<HeaderBarTutorial> {
  int activeIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 220.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: ColorsManager.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.r),
              bottomRight: Radius.circular(8.r),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 16),
                blurRadius: 13,
                spreadRadius: -8,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(40.w, 50.h, 40.w, 0),
            child: CarouselSlider.builder(
              controller: _carouselController,
              options: CarouselOptions(
                height: 207.h,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      images[index],
                      height: 160.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: texts[index],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: AnimatedSmoothIndicator(
            count: 4,
            activeIndex: activeIndex,
            effect: ExpandingDotsEffect(
              dotWidth: 8.w,
              dotHeight: 8.h,
              spacing: 5.w,
              expansionFactor: 4,
              dotColor: ColorsManager.grey,
              activeDotColor: ColorsManager.grey,
            ),
          ),
        ),
        Positioned(
          top: 50.h,
          left: 16.w,
          child: const WhiteBackButton(),
        ),
      ],
    );
  }

  final List<dynamic> images = [
    Assets.svgs.tutorialPic1.path,
    Assets.svgs.tutorialPic2.path,
    Assets.svgs.tutorialPic3.path,
    Assets.svgs.tutorialPic4.path,
  ];
  final List<dynamic> texts = [
    Assets.svgs.tutorialText1.svg(),
    Assets.svgs.tutorialText2.svg(),
    Assets.svgs.tutorialText3.svg(),
    Assets.svgs.tutorialText4.svg(),
  ];
}
