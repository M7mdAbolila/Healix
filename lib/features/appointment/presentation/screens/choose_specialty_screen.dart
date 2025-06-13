import 'package:flutter/material.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';

import '../widgets/specialties_list_view.dart';

class ChooseSpecialtyScreen extends StatelessWidget {
  const ChooseSpecialtyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomScreenAppBar(title: 'Choose Specialty'),
          Expanded(
            child: SpecialtiesListView(),
          )
        ],
      ),
    );
  }
}
