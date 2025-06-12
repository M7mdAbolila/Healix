import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/get_medical_records_response_entity.dart';
import 'medical_record_model.dart';

part 'get_medical_records_response_model.g.dart';

@JsonSerializable()
class GetMedicalRecordsResponseModel extends GetMedicalRecordsResponseEntity {
  @override
  @JsonKey(name: 'records')
  final List<MedicalRecordModel> records;

  const GetMedicalRecordsResponseModel({
    required this.records,
  }) : super(records: records);

  factory GetMedicalRecordsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetMedicalRecordsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMedicalRecordsResponseModelToJson(this);
}
