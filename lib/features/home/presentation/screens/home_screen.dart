import 'package:flutter/material.dart';

import '../widgets/home_content_widget.dart';
import '../widgets/home_header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
