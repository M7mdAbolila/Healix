import 'package:equatable/equatable.dart';
import 'family_group_entity.dart';

class GetFamilyGroupResponseEntity extends Equatable {
  final FamilyGroupEntity? familyGroup;

  const GetFamilyGroupResponseEntity({
    this.familyGroup,
  });

  @override
  List<Object?> get props => [familyGroup];
}
