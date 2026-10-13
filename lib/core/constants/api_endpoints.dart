class ApiEndpoints {
  static const String baseUrl = 'https://dummyjson.com/';
  static const String products = 'products';
  static const String searchProducts = 'products/search';
  static const String categoryList = 'products/category-list';

  static String productsByCategory(String category) =>
      'products/category/$category';
}
