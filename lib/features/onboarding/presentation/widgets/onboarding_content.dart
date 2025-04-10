import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/theming/colors.dart';
import 'package:healix/core/theming/text_styles.dart';

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.verticalPadding,
    required this.slideFromRight,
  });

  final String title;
  final String description;
  final String imagePath;
  final double? verticalPadding;
  final bool slideFromRight;

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideOffsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    Offset beginOffset = widget.slideFromRight
        ? const Offset(1.0, -0.2)
        : const Offset(-1.0, -0.2);

    _slideOffsetAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: AppTextStyles.fontTitleText(
            color: ColorsManager.primaryColor,
          ),
        ),
        verticalSpace(48),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                _slideOffsetAnimation.value.dx * 150,
                _slideOffsetAnimation.value.dy * 150,
              ),
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: SvgPicture.asset(
                  widget.imagePath,
                  height: 230.h,
                ),
              ),
            );
          },
        ),
        verticalSpace(widget.verticalPadding ?? 32),
        Text(
          widget.description,
          textAlign: TextAlign.center,
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkGreyText,
          ),
        ),
      ],
    );
  }
}
