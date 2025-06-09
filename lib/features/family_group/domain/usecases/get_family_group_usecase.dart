import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../../data/models/get_family_group_response_model.dart';
import '../entities/get_family_group_request_entity.dart';
import '../repositories/family_group_repository.dart';

class GetFamilyGroupUseCase {
  final FamilyGroupRepository repository;
  GetFamilyGroupUseCase(this.repository);

  Future<Either<ApiErrorModel, GetFamilyGroupResponseModel>> call(
      GetFamilyGroupRequestEntity request) {
    return repository.getFamilyGroup(request);
  }
}
