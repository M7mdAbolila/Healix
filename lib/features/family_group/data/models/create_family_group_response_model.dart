import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/create_family_group_response_entity.dart';

part 'create_family_group_response_model.g.dart';

@JsonSerializable()
class CreateFamilyGroupResponseModel extends CreateFamilyGroupResponseEntity {
  const CreateFamilyGroupResponseModel({
    super.name,
    super.code,
  });

  factory CreateFamilyGroupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateFamilyGroupResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFamilyGroupResponseModelToJson(this);
}

@JsonSerializable()
class CreateFamilyGroupWrapper {
  @JsonKey(name: 'familyGroup')
  final CreateFamilyGroupResponseModel familyGroup;

  const CreateFamilyGroupWrapper({
    required this.familyGroup,
  });

  factory CreateFamilyGroupWrapper.fromJson(Map<String, dynamic> json) =>
      _$CreateFamilyGroupWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFamilyGroupWrapperToJson(this);
}
