import 'package:dio/dio.dart';
import 'package:shoply/features/data/product_model.dart';

class ProductsService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://dummyjson.com/",
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Map<String, dynamic> _getSortParams({required String selectedOption}) {
    final Map<String, String> sortOption;

    switch (selectedOption) {
      case 'Price: Low to High':
        sortOption = {"sortBy": "price", "order": "asc"};
        break;
      case 'Price: High to Low':
        sortOption = {"sortBy": "price", "order": "desc"};
        break;
      case 'Title: A-Z':
        sortOption = {"sortBy": "title", "order": "asc"};
        break;
      case 'Recommended':
      default:
        sortOption = {"sortBy": "rating", "order": "desc"};
        break;
    }

    return {
      "limit": 0,
      "select": "id,title,price,thumbnail,rating",
      ...sortOption,
    };
  }

  // get products as model
  Future<({List<ProductModel> products, num total})> fetchProducts({
    required String search,
    required String selectedOption,
    required String selectedCategory,
  }) async {
    final Response<dynamic> response;

    if (search.isNotEmpty) {
      response = await dio.get(
        'products/search',
        queryParameters: {
          ..._getSortParams(selectedOption: selectedOption),
          'q': search,
        },
      );
    } else if (selectedCategory != 'All') {
      response = await dio.get(
        "products/category/$selectedCategory",
        queryParameters: _getSortParams(selectedOption: selectedOption),
      );
    } else {
      response = await dio.get(
        'products',
        queryParameters: _getSortParams(selectedOption: selectedOption),
      );
    }

    List<ProductModel> products = (response.data['products'] as List)
        .map((item) => ProductModel.fromJson(item))
        .toList();
    final num total = response.data['total'];
    return (products: products, total: total);
  }
}
