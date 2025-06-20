import 'package:equatable/equatable.dart';
import 'family_member_entity.dart';

class FamilyGroupEntity extends Equatable {
  final String? name;
  final String? code;
  final List<FamilyMemberEntity>? members;
  final String? id;

  const FamilyGroupEntity({
    this.name,
    this.code,
    this.members,
    this.id,
  });

  @override
  List<Object?> get props => [
        name,
        code,
        members,
        id,
      ];
}
