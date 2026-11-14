import 'package:shoply/features/home/data/models/product_model.dart';
import 'package:shoply/features/home/data/services/categories_service.dart';
import 'package:shoply/features/home/data/services/products_service.dart';

class ProductsRepo {
  final ProductsService _productsService;
  final CategoriesService _categoriesService;

  ProductsRepo(this._productsService, this._categoriesService);

  Future<({List<ProductModel> products, num total})> fetchProducts({
    required String search,
    required String selectedOption,
    required String selectedCategory,
  }) async {
    return await _productsService.fetchProducts(
      search: search,
      selectedOption: selectedOption,
      selectedCategory: selectedCategory,
    );
  }

  Future<List<String>> getCategoryList() async {
    return await _categoriesService.getCategoryList();
  }
}
