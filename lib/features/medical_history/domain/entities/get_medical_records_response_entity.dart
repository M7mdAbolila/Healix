import 'package:equatable/equatable.dart';
import 'medical_record_entity.dart';

class GetMedicalRecordsResponseEntity extends Equatable {
  final List<MedicalRecordEntity> records;

  const GetMedicalRecordsResponseEntity({
    required this.records,
  });

  @override
  List<Object?> get props => [records];
}
