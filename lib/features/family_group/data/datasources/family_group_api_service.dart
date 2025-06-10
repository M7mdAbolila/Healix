import 'package:healix/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/get_family_group_request_model.dart';
import '../models/get_family_group_response_model.dart';
import '../models/create_family_group_request_model.dart';
import '../models/create_family_group_response_model.dart';

part 'family_group_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class FamilyGroupApiService {
  factory FamilyGroupApiService(Dio dio, {String baseUrl}) =
      _FamilyGroupApiService;

  @GET(ApiConstants.familyGroupsEndpoint)
  Future<GetFamilyGroupResponseModel> getFamilyGroup();

  @GET(ApiConstants.familyGroupsEndpoint)
  Future<GetFamilyGroupResponseModel> getFamilyGroupWithCode(
    @Body() GetFamilyGroupRequestModel body,
  );

  @POST(ApiConstants.familyGroupsEndpoint)
  Future<CreateFamilyGroupWrapper> createFamilyGroup(
    @Body() CreateFamilyGroupRequestModel body,
  );

  @POST('${ApiConstants.familyGroupsEndpoint}/{id}')
  Future<void> joinFamilyGroup(@Path('id') String id);
}
