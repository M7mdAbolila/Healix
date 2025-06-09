import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/get_family_group_response_entity.dart';
import 'family_group_model.dart';

part 'get_family_group_response_model.g.dart';

@JsonSerializable()
class GetFamilyGroupResponseModel extends GetFamilyGroupResponseEntity {
  @override
  @JsonKey(name: 'familyGroup')
  final FamilyGroupModel? familyGroup;

  const GetFamilyGroupResponseModel({
    this.familyGroup,
  }) : super(familyGroup: familyGroup);

  factory GetFamilyGroupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetFamilyGroupResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetFamilyGroupResponseModelToJson(this);
}
