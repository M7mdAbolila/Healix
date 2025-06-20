import 'package:json_annotation/json_annotation.dart';

part 'family_summary_request_model.g.dart';

@JsonSerializable()
class FamilySummaryRequestModel {
  final String familyId;

  const FamilySummaryRequestModel({
    required this.familyId,
  });

  factory FamilySummaryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FamilySummaryRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$FamilySummaryRequestModelToJson(this);
}
