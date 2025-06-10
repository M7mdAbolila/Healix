import 'package:equatable/equatable.dart';

class MedicineEntity extends Equatable {
  final String? medicineName;
  final String? frequency;
  final String? endDate;
  final DateTime? startDate;

  const MedicineEntity({
    this.medicineName,
    this.frequency,
    this.endDate,
    this.startDate,
  });

  @override
  List<Object?> get props => [
        medicineName,
        frequency,
        endDate,
        startDate,
      ];
}
