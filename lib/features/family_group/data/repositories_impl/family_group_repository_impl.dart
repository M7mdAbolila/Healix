import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_handler.dart';
import 'package:healix/core/networking/api_error_model.dart';
import 'package:healix/features/family_group/domain/entities/get_family_group_request_entity.dart';
import 'package:healix/features/family_group/domain/entities/create_family_group_request_entity.dart';
import '../../domain/repositories/family_group_repository.dart';
import '../datasources/family_group_api_service.dart';
import '../models/get_family_group_request_model.dart';
import '../models/get_family_group_response_model.dart';
import '../models/create_family_group_request_model.dart';
import '../models/create_family_group_response_model.dart';

class FamilyGroupRepositoryImpl implements FamilyGroupRepository {
  final FamilyGroupApiService apiService;

  FamilyGroupRepositoryImpl(this.apiService);

  @override
  Future<Either<ApiErrorModel, GetFamilyGroupResponseModel>> getFamilyGroup(
      GetFamilyGroupRequestEntity request) async {
    final GetFamilyGroupRequestModel requestModel = GetFamilyGroupRequestModel(
      code: request.code,
    );
    try {
      final response = await apiService.getFamilyGroup(requestModel);
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, CreateFamilyGroupResponseModel>>
      createFamilyGroup(CreateFamilyGroupRequestEntity request) async {
    final CreateFamilyGroupRequestModel requestModel =
        CreateFamilyGroupRequestModel(
      name: request.name,
    );
    try {
      final wrapper = await apiService.createFamilyGroup(requestModel);
      return right(wrapper.familyGroup);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, void>> joinFamilyGroup(
      String familyGroupId) async {
    try {
      final response = await apiService.joinFamilyGroup(familyGroupId);
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }
}
