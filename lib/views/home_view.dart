import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/search_field.dart';
import '../widgets/categories_bar.dart';
import '../widgets/results_header.dart';
import '../widgets/products_grid.dart';
import '../widgets/bottom_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: const [
              SizedBox(height: 12),
              CustomAppBar(),
              SizedBox(height: 16),
              SearchField(),
              SizedBox(height: 16),
              CategoriesBar(),
              SizedBox(height: 16),
              ResultsHeader(),
              SizedBox(height: 12),
              Expanded(child: ProductsGrid()),
              SizedBox(height: 12),
              BottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}
