// import 'package:dartz/dartz.dart';

// import '../../../../core/networking/api_error_handler.dart';
// import '../../../../core/networking/api_error_model.dart';
// import '../data_source/feature_api_service.dart';
// import '../models/feature_request_body.dart';
// import '../models/feature_response_model.dart';

// class Feature Repo {
//   final Feature ApiService _apiService;

//   Feature Repo(this._apiService);

//   Future<Either<ApiErrorModel, FeatureResponseModel>> functionName(
//       FeatureRequestBody requestBody) async {
//     try {
//       final reponse = await _apiService.postFunctionName(requestBody);
//       return right(reponse);
//     } catch (error) {
//       return left(
//         ApiErrorHandler.handle(error),
//       );
//     }
//   }
// }
