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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 12),
              CustomAppBar(),
              SizedBox(height: 16),
              SearchField(),
              SizedBox(height: 16),
              CategoriesBar(
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
              SizedBox(height: 16),
              ResultsHeader(total: 194, viewedCount: 20),
              SizedBox(height: 12),
              Expanded(child: ProductsGrid(selectedCategory: selectedCategory)),
              SizedBox(height: 12),
              BottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}
