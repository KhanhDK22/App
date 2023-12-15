import 'package:app_food_new/const/message/network_error_message.dart';
import 'package:dio/dio.dart';

class NetworkService {
  static String handleExeption(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return handleBadResponse(exception);
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
        return ErrorMessage.connectionError;
      case DioExceptionType.connectionTimeout:
        return ErrorMessage.connectionTimeout;
      case DioExceptionType.receiveTimeout:
        return ErrorMessage.receiveTimeout;
      case DioExceptionType.sendTimeout:
        return ErrorMessage.sendTimeout;
      case DioExceptionType.unknown:
        return ErrorMessage.unknown;
    }
  }

  static String handleBadResponse(DioException exception) {
    int statusCode = exception.response?.statusCode ?? 500;
    if (statusCode == 401) {
      return ErrorMessage.noAuth;
    } else if (statusCode == 403) {
      return ErrorMessage.noPermisstion;
    } else if (statusCode == 404) {
      return ErrorMessage.notFound;
    } else if (statusCode == 405) {
      return ErrorMessage.method;
    } else if (statusCode >= 500) {
      return ErrorMessage.server;
    }
    return ErrorMessage.unknown;
  }
}
