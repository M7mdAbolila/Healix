import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/family_member_entity.dart';

part 'family_member_model.g.dart';

@JsonSerializable()
class FamilyMemberModel extends FamilyMemberEntity {
  const FamilyMemberModel({
    super.fname,
    super.lname,
    super.email,
    super.photoUrl,
    super.phoneNumber,
  });

  factory FamilyMemberModel.fromJson(Map<String, dynamic> json) =>
      _$FamilyMemberModelFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyMemberModelToJson(this);
}
