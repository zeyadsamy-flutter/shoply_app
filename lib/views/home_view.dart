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
  final TextEditingController searchController = TextEditingController();

  String selectedCategory = 'All';
  int productsCount = 194;
  int viewedCount = 8;
  String selectedOption = 'Recommended';
  String search = "";

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                SearchField(
                  controller: searchController,
                  search: (value) {
                    setState(() {
                      search = value;
                      viewedCount = 8;
                    });
                  },
                ),
                const SizedBox(height: 16),
                CategoriesBar(
                  onCategorySelected: (category) {
                    setState(() {
                      selectedCategory = category;
                      viewedCount = 8;
                      selectedOption = 'Recommended';
                      search = "";
                      searchController.clear();
                    });
                  },
                ),
                const SizedBox(height: 16),
                ResultsHeader(
                  total: productsCount,
                  viewedCount: viewedCount,
                  selectedOption: selectedOption,
                  onSelected: (value) {
                    setState(() {
                      selectedOption = value;
                      viewedCount = 8;
                    });
                  },
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ProductsGrid(
                    productsTotal: productsCount,
                    search: search,
                    selectedOption: selectedOption,
                    selectedCategory: selectedCategory,
                    viewedCount: viewedCount,
                    onLoadMore: () {
                      setState(() {
                        viewedCount += 8;
                      });
                    },
                    productsCount: (value) {
                      setState(() {
                        productsCount = value;
                      });
                    },
                  ),
                ),
                // const SizedBox(height: 12),
                // BottomSection(
                //   viewedCount: viewedCount,
                //   totalCount: productsCount,
                //   onLoadMore: () {
                //     setState(() {
                //       viewedCount += 8;
                //     });
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
