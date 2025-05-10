import 'package:flutter/material.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';

class DoctorsListScreen extends StatelessWidget {
  const DoctorsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomScreenAppBar(title: 'Choose Doctor'),
        ],
      ),
    );
  }
}
