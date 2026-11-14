import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shoply/core/network/api_service.dart';
import 'package:shoply/core/network/dio_client.dart';
import 'package:shoply/features/home/cubit/product_grid_state.dart';
import 'package:shoply/features/home/data/repo/products_repo.dart';

class ProductGridCubit extends Cubit<ProductGridState> {
  final ProductsRepo _productsRepo = ProductsRepo(ApiService(DioClient()));
  ProductGridCubit() : super(ProductGridState());
  void selectOption(String selected) {
    if (state.selectedOption == selected) return;

    emit(
      ProductGridState(
        selectedOption: selected,
        search: "",
        defaultSelectedCategory: state.selectedCategory,
        viewedCount: 8,
        productsCount: state.total,
        products: state.products,
        categories: state.categories,
      ),
    );
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final data = await _productsRepo.fetchProducts(
      search: state.search,
      selectedCategory: state.selectedCategory,
      selectedOption: state.selectedOption,
    );
    emit(
      ProductGridState(
        selectedOption: state.selectedOption,
        search: state.search,
        defaultSelectedCategory: state.selectedCategory,
        viewedCount: state.viewedCount,
        productsCount: data.total,
        products: data.products,
        categories: state.categories,
      ),
    );
  }

  Timer? _debounce;

  void inputSearch(String input) {
    emit(
      ProductGridState(
        selectedOption: "Recommended",
        search: input,
        defaultSelectedCategory: state.selectedCategory,
        viewedCount: 8,
        productsCount: state.total,
        products: state.products,
        categories: state.categories,
      ),
    );
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      fetchProducts();
    });
  }

  void selectCategory(String category) {
    if (state.selectedCategory == category) return;

    emit(
      ProductGridState(
        selectedOption: 'Recommended',
        search: '',
        defaultSelectedCategory: category,
        viewedCount: 8,
        productsCount: state.total,
        products: state.products,
        categories: state.categories,
      ),
    );

    fetchProducts();
  }

  void updateViewedCount() {
    int newViewedCount = state.viewedCount + 8;
    emit(
      ProductGridState(
        selectedOption: state.selectedOption,
        search: state.search,
        defaultSelectedCategory: state.selectedCategory,
        viewedCount: newViewedCount,
        productsCount: state.total,
        products: state.products,
        categories: state.categories,
      ),
    );
  }

  Future<void> getCategoryList() async {
    final fetchedCategories = await _productsRepo.getCategoryList();
    final List<String> categoriesWithAll = ["All", ...fetchedCategories];
    emit(
      ProductGridState(
        selectedOption: state.selectedOption,
        search: state.search,
        defaultSelectedCategory: state.selectedCategory,
        viewedCount: state.viewedCount,
        productsCount: state.total,
        products: state.products,
        categories: categoriesWithAll,
      ),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
