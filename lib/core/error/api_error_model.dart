enum ApiErrorType {
  noInternet,
  timeout,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  serverError,
  cancel,
  unknown,
}

class ApiErrorModel {
  final String message;
  final int? statusCode;
  final ApiErrorType errorType;

  const ApiErrorModel({
    required this.message,
    required this.errorType,
    this.statusCode,
  });

  factory ApiErrorModel.defaultError([String? customMessage]) {
    return ApiErrorModel(
      message: customMessage ?? 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.',
      errorType: ApiErrorType.unknown,
    );
  }
}
