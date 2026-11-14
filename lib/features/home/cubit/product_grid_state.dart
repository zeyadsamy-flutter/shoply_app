import 'package:equatable/equatable.dart';
import 'package:shoply/features/home/data/models/product_model.dart';

class ProductGridState extends Equatable {
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
  // copy with
  ProductGridState copyWith({
    String? selectedOption,
    String? search,
    String? selectedCategory,
    int? viewedCount,
    num? total,
    List<ProductModel>? products,
    List<String>? categories,
  }) {
    return ProductGridState(
      selectedOption: selectedOption ?? _selectedOption,
      search: search ?? _search,
      defaultSelectedCategory: selectedCategory ?? _defaultSelectedCategory,
      viewedCount: viewedCount ?? _viewedCount,
      productsCount: total ?? _productsCount,
      products: products ?? _products,
      categories: categories ?? _categories,
    );
  }

  List<ProductModel> get products => List.unmodifiable(_products);
  List<String> get categories => List.unmodifiable(_categories);
  String get selectedOption => _selectedOption;
  String get search => _search;
  String get selectedCategory => _defaultSelectedCategory;
  int get viewedCount => _viewedCount;
  num get total => _productsCount;

  @override
  List<Object?> get props => [
    _selectedOption,
    _search,
    _defaultSelectedCategory,
    _viewedCount,
    _productsCount,
    _products,
    _categories,
  ];
}
