import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoply/core/network/api_service.dart';
import 'package:shoply/core/network/dio_client.dart';
import 'package:shoply/features/home/data/models/product_model.dart';
import 'package:shoply/features/home/data/repo/products_repo.dart';

class ProductGridController extends ChangeNotifier {
  String _selectedOption = 'Recommended';
  String get selectedOption => _selectedOption;
  void selectOption(String selected) {
    if (_selectedOption == selected) return;
    _selectedOption = selected;
    _search = "";
    _viewedCount = 8;
    fetchProducts();
    searchController.clear();
  }

  // state of search
  String _search = "";
  Timer? _debounce;
  // getter of search
  String get search => _search;
  // update of search
  void inputSearch(String inpute) {
    _search = inpute;
    _selectedOption = "Recommended";
    _viewedCount = 8;
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      fetchProducts();
    });
  }

  // state of category
  String _defaultSelectedCategory = 'All';

  // getter of state
  String get selectedCategory => _defaultSelectedCategory;
  // update of state
  void selectCategory(String category) {
    if (_defaultSelectedCategory == category) return;

    _defaultSelectedCategory = category;
    _selectedOption = 'Recommended';
    _search = '';
    _viewedCount = 8;
    searchController.clear();

    fetchProducts();
  }

  int _viewedCount = 8;
  void updateViewedCount() {
    _viewedCount += 8;
    notifyListeners();
  }

  int get viewedCount => _viewedCount;

  num _productsCount = 0;
  num get total => _productsCount;

  final ProductsRepo _productsRepo = ProductsRepo(ApiService(DioClient()));

  List<ProductModel> _products = [];
  Future<void> fetchProducts() async {
    final data = await _productsRepo.fetchProducts(
      search: _search,
      selectedCategory: _defaultSelectedCategory,
      selectedOption: _selectedOption,
    );
    _products = data.products;
    _productsCount = data.total;
    notifyListeners();
  }

  List<ProductModel> get products => _products;

  List<String> _categories = [];
  Future<void> getCategoryList() async {
    final fetchedCategories = await _productsRepo.getCategoryList();
    _categories = ["All", ...fetchedCategories];
    notifyListeners();
  }

  List<String> get categories => _categories;

  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
