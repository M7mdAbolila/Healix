import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/family_group_entity.dart';
import 'family_member_model.dart';

part 'family_group_model.g.dart';

@JsonSerializable()
class FamilyGroupModel extends FamilyGroupEntity {
  @override
  @JsonKey(name: 'members')
  final List<FamilyMemberModel>? members;

  const FamilyGroupModel({
    super.name,
    super.code,
    this.members,
    super.id,
  }) : super(members: members);

  factory FamilyGroupModel.fromJson(Map<String, dynamic> json) =>
      _$FamilyGroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyGroupModelToJson(this);
}
