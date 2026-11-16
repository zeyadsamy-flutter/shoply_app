import 'api_error_model.dart';

sealed class ApiResult<T> {
  const ApiResult();

  const factory ApiResult.success(T data) = ApiSuccess<T>;
  const factory ApiResult.error(ApiErrorModel error) = ApiError<T>;

  R when<R>({
    required R Function(T data) onSuccess,
    required R Function(ApiErrorModel error) onError,
  }) {
    return switch (this) {
      ApiSuccess<T>(:final data) => onSuccess(data),
      ApiError<T>(:final error) => onError(error),
    };
  }
}

final class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  const ApiSuccess(this.data);
}

final class ApiError<T> extends ApiResult<T> {
  final ApiErrorModel error;
  const ApiError(this.error);
}
