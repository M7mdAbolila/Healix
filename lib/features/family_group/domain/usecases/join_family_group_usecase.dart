import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../repositories/family_group_repository.dart';

class JoinFamilyGroupUseCase {
  final FamilyGroupRepository _repository;

  JoinFamilyGroupUseCase(this._repository);

  Future<Either<ApiErrorModel, void>> call(String familyGroupId) async {
    return await _repository.joinFamilyGroup(familyGroupId);
  }
}
