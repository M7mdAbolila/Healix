import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/patient_summary_request_entity.dart';

part 'patient_summary_request_model.g.dart';

@JsonSerializable()
class PatientSummaryRequestModel extends PatientSummaryRequestEntity {
  @override
  @JsonKey(name: 'patientId')
  final String? patientId;

  const PatientSummaryRequestModel({
    required this.patientId,
  }) : super(
          patientId: patientId,
        );

  factory PatientSummaryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PatientSummaryRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientSummaryRequestModelToJson(this);
}
