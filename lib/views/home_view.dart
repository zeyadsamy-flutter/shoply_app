import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/search_field.dart';
import '../widgets/categories_bar.dart';
import '../widgets/results_header.dart';
import '../widgets/products_grid.dart';
import '../widgets/bottom_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedCategory = 'All';
  int productsCount = 194;
  int viewedCount = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 12),
              const CustomAppBar(),
              const SizedBox(height: 16),
              const SearchField(),
              const SizedBox(height: 16),
              CategoriesBar(
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                    viewedCount = 8;
                  });
                },
              ),
              const SizedBox(height: 16),
              ResultsHeader(total: productsCount, viewedCount: viewedCount),
              const SizedBox(height: 12),
              Expanded(
                child: ProductsGrid(
                  selectedCategory: selectedCategory,
                  onProductsCountLoaded: (value) {
                    setState(() {
                      productsCount = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 12),
              BottomSection(
                viewedCount: viewedCount,
                totalCount: productsCount,
                onLoadMore: () {
                  setState(() {
                    viewedCount += 8;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
