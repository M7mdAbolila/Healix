import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../repositories/family_group_repository.dart';

class JoinFamilyGroupUseCase {
  final FamilyGroupRepository repository;
  JoinFamilyGroupUseCase(this.repository);

  Future<Either<ApiErrorModel, void>> call(String familyGroupId) {
    return repository.joinFamilyGroup(familyGroupId);
  }
}
