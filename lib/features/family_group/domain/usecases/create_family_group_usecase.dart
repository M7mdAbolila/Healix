import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../../data/models/create_family_group_response_model.dart';
import '../entities/create_family_group_request_entity.dart';
import '../repositories/family_group_repository.dart';

class CreateFamilyGroupUseCase {
  final FamilyGroupRepository _repository;

  CreateFamilyGroupUseCase(this._repository);

  Future<Either<ApiErrorModel, CreateFamilyGroupResponseModel>> call(
      CreateFamilyGroupRequestEntity request) async {
    return await _repository.createFamilyGroup(request);
  }
}
