import 'package:shoply/features/home/data/models/product_model.dart';

class ProductGridState {
  final String _selectedOption;
  final String _search;
  final String _defaultSelectedCategory;
  final int _viewedCount;
  final num _productsCount;
  final List<ProductModel> _products;
  final List<String> _categories;

  const ProductGridState({
    this._selectedOption = 'Recommended',
    this._search = "",
    this._defaultSelectedCategory = 'All',
    this._viewedCount = 8,
    this._productsCount = 0,
    this._products = const [],
    this._categories = const [],
  });

  List<ProductModel> get products => _products;
  List<String> get categories => _categories;
  String get selectedOption => _selectedOption;
  String get search => _search;
  String get selectedCategory => _defaultSelectedCategory;
  int get viewedCount => _viewedCount;
  num get total => _productsCount;
}
