import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(errMessage: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(
              errMessage: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
              errMessage: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              errMessage:
                  "Connection to the server failed due to internet connection");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              errMessage: "Receive timeout in connection with the server");
        case DioExceptionType.badResponse:
          return _handleError(error.response);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              errMessage: "Send timeout in connection with the server");
        default:
          return ApiErrorModel(errMessage: "Something went wrong");
      }
    } else {
      return ApiErrorModel(errMessage: "Unknown error occurred");
    }
  }
}

ApiErrorModel _handleError(Response<dynamic>? response) {
  if (response == null) {
    return ApiErrorModel(errMessage: "No response received");
  }

  if (response.statusCode != 200) {
    final errorMessage = response.data is Map && response.data['error'] != null
        ? response.data['error']['message']
        : response.statusMessage ?? "Unknown error occurred";
    return ApiErrorModel(errMessage: errorMessage);
  }

  // In case the function is called in a successful status code situation.
  return ApiErrorModel(
    errMessage: "Unexpected success response in error handler",
  );
}
