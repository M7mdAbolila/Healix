import 'package:flutter/widgets.dart';
import 'package:healix/features/appointment/presentation/widgets/doctor_card_widget.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const DoctorCardWidget(),
    );
  }
}
