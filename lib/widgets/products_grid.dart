import 'package:flutter/material.dart';
import 'package:shoply/features/data/product_model.dart';
import 'package:shoply/features/data/products_service.dart';
import 'package:shoply/widgets/bottom_section.dart';

import 'product_card.dart';

class ProductsGrid extends StatefulWidget {
  final String selectedCategory;
  final Function(num) productsCount;
  final num productsTotal;
  final int viewedCount;
  final String selectedOption;
  final VoidCallback onLoadMore;
  final String search;
  const ProductsGrid({
    super.key,
    required this.selectedCategory,
    required this.productsCount,
    required this.viewedCount,
    required this.selectedOption,
    required this.search,
    required this.productsTotal,
    required this.onLoadMore,
  });
  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  List<ProductModel> products = [];

  Future<void> fetchProducts() async {
    final data = await _productsAsBox.fetchProducts(
      search: widget.search,
      selectedCategory: widget.selectedCategory,
      selectedOption: widget.selectedOption,
    );

    setState(() {
      products = data.products;
      widget.productsCount(data.total);
    });
  }

  final ProductsService _productsAsBox = ProductsService();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  void didUpdateWidget(covariant ProductsGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedCategory != widget.selectedCategory ||
        oldWidget.selectedOption != widget.selectedOption ||
        oldWidget.search != widget.search) {
      fetchProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentCount = products.length < widget.viewedCount
        ? products.length
        : widget.viewedCount;

    return CustomScrollView(
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.68,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            return ProductCard(product: products[index]);
          }, childCount: currentCount),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: BottomSection(
              viewedCount: widget.viewedCount,
              totalCount: widget.productsTotal,
              onLoadMore: widget.onLoadMore,
            ),
          ),
        ),
      ],
    );
  }
}
