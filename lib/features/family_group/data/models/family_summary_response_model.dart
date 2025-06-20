import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/family_summary_entity.dart';

part 'family_summary_response_model.g.dart';

@JsonSerializable()
class FamilySummaryResponseModel extends FamilySummaryEntity {
  const FamilySummaryResponseModel({
    required super.summary,
  });

  factory FamilySummaryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FamilySummaryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FamilySummaryResponseModelToJson(this);
}
