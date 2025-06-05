import 'package:flutter/material.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';

class FamilyGroupScreen extends StatelessWidget {
  const FamilyGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomScreenAppBar(title: 'Family Group'),
        ],
      ),
    );
  }
}
