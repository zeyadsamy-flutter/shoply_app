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

    emit(state.copyWith(selectedOption: selected, search: "", viewedCount: 8));
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final data = await _productsRepo.fetchProducts(
      search: state.search,
      selectedCategory: state.selectedCategory,
      selectedOption: state.selectedOption,
    );
    emit(state.copyWith(total: data.total, products: data.products));
  }

  Timer? _debounce;

  void inputSearch(String input) {
    emit(
      state.copyWith(
        selectedOption: "Recommended",
        search: input,
        viewedCount: 8,
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
      state.copyWith(
        selectedOption: 'Recommended',
        search: '',
        selectedCategory: category,
        viewedCount: 8,
      ),
    );

    fetchProducts();
  }

  void updateViewedCount() {
    int newViewedCount = state.viewedCount + 8;
    emit(state.copyWith(viewedCount: newViewedCount));
  }

  Future<void> getCategoryList() async {
    final fetchedCategories = await _productsRepo.getCategoryList();
    final List<String> categoriesWithAll = ["All", ...fetchedCategories];
    emit(state.copyWith(categories: categoriesWithAll));
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
