import 'package:shoply/core/network/dio_client.dart';

class ApiService {
  final DioClient _dioClient;

  ApiService(this._dioClient);

  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dioClient.dio.get(
      endpoint,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
