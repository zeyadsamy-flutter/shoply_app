import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply/core/network/api_service.dart';
import 'package:shoply/core/network/dio_client.dart';
import 'package:shoply/features/home/cubit/product_selected_cubit.dart';
import 'package:shoply/features/home/cubit/product_grid_cubit.dart';
import 'package:shoply/features/home/data/repo/products_repo.dart';
import 'package:shoply/features/home/data/services/categories_service.dart';
import 'package:shoply/features/home/data/services/products_service.dart';
import 'package:shoply/features/home/presentation/widgets/products_section.dart';

import '../widgets/categories_bar.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/results_header.dart';
import '../widgets/search_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ProductSelectedCubit _selectedController;
  late final ProductGridCubit _gridController;

  @override
  void initState() {
    super.initState();
    final ApiService apiService = ApiService(DioClient());
    final ProductsService productsService = ProductsService(
      apiService: apiService,
    );
    final CategoriesService categoriesService = CategoriesService(
      apiService: apiService,
    );
    final ProductsRepo productsRepo = ProductsRepo(
      productsService,
      categoriesService,
    );
    _selectedController = ProductSelectedCubit();
    _gridController = ProductGridCubit(productsRepo: productsRepo);
    _gridController.fetchProducts();
    _gridController.getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _gridController),
        BlocProvider(create: (context) => _selectedController),
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  const CustomAppBar(),
                  const SizedBox(height: 16),
                  SearchField(),
                  const SizedBox(height: 16),
                  CategoriesBar(),
                  const SizedBox(height: 16),
                  ResultsHeader(),
                  const SizedBox(height: 12),
                  const Expanded(child: ProductsSection()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
