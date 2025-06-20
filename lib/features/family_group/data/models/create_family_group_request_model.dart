import 'package:healix/features/family_group/domain/entities/create_family_group_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_family_group_request_model.g.dart';

@JsonSerializable()
class CreateFamilyGroupRequestModel extends CreateFamilyGroupRequestEntity {
  const CreateFamilyGroupRequestModel({
    required super.name,
  });

  factory CreateFamilyGroupRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateFamilyGroupRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFamilyGroupRequestModelToJson(this);
}
