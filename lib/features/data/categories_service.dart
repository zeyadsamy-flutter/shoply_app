import 'package:dio/dio.dart';

class CategoriesService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://dummyjson.com/",
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future getCatergoryList() async {
    final reponse = await dio.get("products/category-list");
    return reponse;
  }
}
