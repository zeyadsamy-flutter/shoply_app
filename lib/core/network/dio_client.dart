import 'package:dio/dio.dart';
import 'package:shoply/core/constants/api_endpoints.dart';

class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        headers: {'Content-Type': 'application/json'},
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
  }
}