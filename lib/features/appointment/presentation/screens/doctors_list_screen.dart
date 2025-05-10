import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';
import 'package:healix/core/widgets/search_bar_widget.dart';

import '../widgets/doctors_list_view.dart';

class DoctorsListScreen extends StatelessWidget {
  const DoctorsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomScreenAppBar(title: 'Choose Doctor'),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  spacing: 16.h,
                  children: const [
                    SearchBarWidget(padding: EdgeInsets.zero),
                    DoctorsListView(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
