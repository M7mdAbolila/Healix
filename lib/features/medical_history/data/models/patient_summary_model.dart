import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/patient_summary_entity.dart';

part 'patient_summary_model.g.dart';

@JsonSerializable()
class PatientSummaryModel extends PatientSummaryEntity {
  @override
  @JsonKey(name: 'summary')
  final String summary;

  const PatientSummaryModel({
    required this.summary,
  }) : super(
          summary: summary,
        );

  factory PatientSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$PatientSummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientSummaryModelToJson(this);
}
