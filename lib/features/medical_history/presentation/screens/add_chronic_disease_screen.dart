import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_screen_app_bar.dart';

class AddChronicDiseaseScreen extends StatelessWidget {
  const AddChronicDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomScreenAppBar(title: 'Chronic Disease'),
        ],
      ),
    );
  }
}
