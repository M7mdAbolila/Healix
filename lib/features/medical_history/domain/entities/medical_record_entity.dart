import 'package:equatable/equatable.dart';

class MedicalRecordEntity extends Equatable {
  final int recordType;
  final dynamic recordDto;

  const MedicalRecordEntity({
    required this.recordType,
    required this.recordDto,
  });

  @override
  List<Object?> get props => [recordType, recordDto];
}
