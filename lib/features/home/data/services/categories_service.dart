import 'package:shoply/core/constants/api_endpoints.dart';
import 'package:shoply/core/network/api_service.dart';

class CategoriesService {
  final ApiService _apiService ;

  CategoriesService({required this._apiService});
  Future<List<String>> getCategoryList() async {
    final data = await _apiService.get(endpoint: ApiEndpoints.categoryList);
    final List<dynamic> categories = data as List<dynamic>;
    return categories.map((item) => item.toString()).toList();
  }
}
