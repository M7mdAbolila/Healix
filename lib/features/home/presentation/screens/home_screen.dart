import 'package:flutter/material.dart';
import 'package:healix/features/home/presentation/widgets/home_content_widget.dart';
import 'package:healix/features/home/presentation/widgets/home_header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          HomeHeaderWidget(),
          Expanded(
            child: HomeContentWidget(),
          ),
        ],
      ),
    );
  }
}
