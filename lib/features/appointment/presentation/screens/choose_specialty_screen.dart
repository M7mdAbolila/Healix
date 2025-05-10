import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';

import '../../../../core/widgets/search_bar_widget.dart';
import '../widgets/specialties_list_view.dart';

class ChooseSpecialtyScreen extends StatelessWidget {
  const ChooseSpecialtyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomScreenAppBar(title: 'Choose Specialty'),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  children: [
                    const SearchBarWidget(
                      padding: EdgeInsets.zero,
                    ),
                    verticalSpace(24),
                    const SpecialtiesListView()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
