import 'package:dio/dio.dart';

class CategoriesService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://dummyjson.com/",
      headers: {'Content-Type': 'application/json'},
    ),
  );
  Future<List<String>> getCategoryList() async {
    final response = await dio.get("products/category-list");
    final List<dynamic> data = response.data;
    return data.map((item) => item.toString()).toList();
  }
}
