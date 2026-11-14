import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply/features/home/controllers/scopes/product_scope.dart';
import 'package:shoply/features/home/controllers/controller/product_selected_controller.dart';
import 'package:shoply/features/home/cubit/product_grid_cubit.dart';

import '../widgets/categories_bar.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/products_grid.dart';
import '../widgets/results_header.dart';
import '../widgets/search_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ProductSelectedController _controller;
  late final ProductGridCubit _gridController;

  @override
  void initState() {
    super.initState();
    _controller = ProductSelectedController();
    _gridController = ProductGridCubit();
    _gridController.fetchProducts();
    _gridController.getCategoryList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _gridController,
      child: ProductScope(
        controller: _controller,
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
                    Expanded(child: ProductsGrid()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
