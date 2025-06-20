import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/medical_record_entity.dart';

part 'medical_record_model.g.dart';

@JsonSerializable()
class MedicalRecordModel extends MedicalRecordEntity {
  @override
  @JsonKey(name: 'recordType')
  final int recordType;

  @override
  @JsonKey(name: 'recordDto')
  final Map<String, dynamic> recordDto;

  const MedicalRecordModel({
    required this.recordType,
    required this.recordDto,
  }) : super(
          recordType: recordType,
          recordDto: recordDto,
        );

  factory MedicalRecordModel.fromJson(Map<String, dynamic> json) =>
      _$MedicalRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalRecordModelToJson(this);
}
