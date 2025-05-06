import 'package:flutter/material.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';

class UploadedFilesScreen extends StatelessWidget {
  const UploadedFilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomScreenAppBar(title: 'Uploaded Files'),
        ],
      ),
    );
  }
}
