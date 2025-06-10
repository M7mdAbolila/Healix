import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/entities.dart';
import '../../data/models/get_family_group_response_model.dart';
import '../../data/models/create_family_group_response_model.dart';

abstract class FamilyGroupRepository {

  Future<Either<ApiErrorModel, GetFamilyGroupResponseModel>>
      getFamilyGroupWithCode(GetFamilyGroupRequestEntity request);

  Future<Either<ApiErrorModel, CreateFamilyGroupResponseModel>>
      createFamilyGroup(CreateFamilyGroupRequestEntity request);

  Future<Either<ApiErrorModel, void>> joinFamilyGroup(String familyGroupId);
}
