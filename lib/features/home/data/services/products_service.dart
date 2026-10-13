import 'package:shoply/core/network/api_client.dart';
import 'package:shoply/features/home/data/models/product_model.dart';

class ProductsService {
  final ApiClient _apiClient = ApiClient();
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
    final data;
    if (search.isNotEmpty) {
      data = await _apiClient.get(
        endpoint: 'products/search',
        queryParameters: {
          ..._getSortParams(selectedOption: selectedOption),
          'q': search,
        },
      );
    } else if (selectedCategory != 'All') {
      data = await _apiClient.get(
        endpoint: "products/category/$selectedCategory",
        queryParameters: _getSortParams(selectedOption: selectedOption),
      );
    } else {
      data = await _apiClient.get(
        endpoint: 'products',
        queryParameters: _getSortParams(selectedOption: selectedOption),
      );
    }

    List<ProductModel> products = (data['products'] as List)
        .map((item) => ProductModel.fromJson(item))
        .toList();
    final num total = data['total'];
    return (products: products, total: total);
  }
}
