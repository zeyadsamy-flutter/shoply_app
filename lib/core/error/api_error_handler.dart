import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      return _handleDioException(error);
    } else {
      return ApiErrorModel.defaultError();
    }
  }

  static ApiErrorModel _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionError:
        return const ApiErrorModel(
          message: 'لا يوجد اتصال بالإنترنت، يرجى التحقق من الشبكة.',
          errorType: ApiErrorType.noInternet,
        );

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return const ApiErrorModel(
          message: 'انتهت مهلة الاتصال بالسيرفر، يرجى المحاولة لاحقاً.',
          errorType: ApiErrorType.timeout,
        );

      case DioExceptionType.cancel:
        return const ApiErrorModel(
          message: 'تم إلغاء الطلب.',
          errorType: ApiErrorType.cancel,
        );

      case DioExceptionType.badCertificate:
        return const ApiErrorModel(
          message: 'شهادة الأمان غير صالحة.',
          errorType: ApiErrorType.unknown,
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);

      case DioExceptionType.unknown:
        return ApiErrorModel.defaultError();
    }
  }

  static ApiErrorModel _handleBadResponse(Response? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;

    String serverMessage = 'حدث خطأ من السيرفر.';
    if (data is Map<String, dynamic> && data['message'] != null) {
      serverMessage = data['message'].toString();
    }

    switch (statusCode) {
      case 400:
        return ApiErrorModel(
          message: serverMessage,
          statusCode: statusCode,
          errorType: ApiErrorType.badRequest,
        );
      case 401:
        return ApiErrorModel(
          message: serverMessage,
          statusCode: statusCode,
          errorType: ApiErrorType.unauthorized,
        );
      case 403:
        return ApiErrorModel(
          message: serverMessage,
          statusCode: statusCode,
          errorType: ApiErrorType.forbidden,
        );
      case 404:
        return ApiErrorModel(
          message: 'المحتوى المطلوب غير موجود.',
          statusCode: statusCode,
          errorType: ApiErrorType.notFound,
        );
      case 500:
      case 502:
      case 503:
        return ApiErrorModel(
          message: 'عذراً، يوجد عطل مؤقت في السيرفر.',
          statusCode: statusCode,
          errorType: ApiErrorType.serverError,
        );
      default:
        return ApiErrorModel(
          message: serverMessage,
          statusCode: statusCode,
          errorType: ApiErrorType.unknown,
        );
    }
  }
}
