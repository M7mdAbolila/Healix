import 'package:healix/features/family_group/domain/entities/get_family_group_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_family_group_request_model.g.dart';

@JsonSerializable()
class GetFamilyGroupRequestModel extends GetFamilyGroupRequestEntity {
  const GetFamilyGroupRequestModel({
    required super.code,
  });

  factory GetFamilyGroupRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetFamilyGroupRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetFamilyGroupRequestModelToJson(this);
}
