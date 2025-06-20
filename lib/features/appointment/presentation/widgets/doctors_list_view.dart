import 'package:flutter/widgets.dart';
import 'package:healix/features/appointment/presentation/widgets/doctor_card_widget.dart';
import '../../domain/entities/get_doctors_response_entity.dart';

class DoctorsListView extends StatelessWidget {
  final List<DoctorEntity> doctors;

  const DoctorsListView({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    if (doctors.isEmpty) {
      return const Center(
        child: Text('No doctors found'),
      );
    }

    return ListView.builder(
      itemCount: doctors.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => DoctorCardWidget(doctor: doctors[index]),
    );
  }
}
