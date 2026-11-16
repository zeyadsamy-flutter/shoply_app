import 'package:shoply/core/error/api_error_handler.dart';
import 'package:shoply/core/error/api_result.dart';
import 'package:shoply/features/home/data/models/product_model.dart';
import 'package:shoply/features/home/data/services/categories_service.dart';
import 'package:shoply/features/home/data/services/products_service.dart';

class ProductsRepo {
  final ProductsService _productsService;
  final CategoriesService _categoriesService;

  ProductsRepo(this._productsService, this._categoriesService);

  Future<ApiResult<({List<ProductModel> products, num total})>> fetchProducts({
    required String search,
    required String selectedOption,
    required String selectedCategory,
  }) async {
    try {
      final result = await _productsService.fetchProducts(
        search: search,
        selectedOption: selectedOption,
        selectedCategory: selectedCategory,
      );
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.error(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<String>>> getCategoryList() async {
    try {
      final categories = await _categoriesService.getCategoryList();
      return ApiResult.success(categories);
    } catch (e) {
      return ApiResult.error(ApiErrorHandler.handle(e));
    }
  }
}
