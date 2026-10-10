import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoply/widgets/bottom_section.dart';

import 'product_card.dart';

class ProductsGrid extends StatefulWidget {
  final String selectedCategory;
  final Function(int) productsCount;
  final int productsTotal;
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
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://dummyjson.com/",
      headers: {'Content-Type': 'application/json'},
    ),
  );

  List products = [];

  Map<String, dynamic> _getSortParams() {
    switch (widget.selectedOption) {
      case 'Price: Low to High':
        return {"limit": 0, "sortBy": "price", "order": "asc"};
      case 'Price: High to Low':
        return {"limit": 0, "sortBy": "price", "order": "desc"};
      case 'Title: A-Z':
        return {"limit": 0, "sortBy": "title", "order": "asc"};
      case 'Recommended':
      default:
        return {"limit": 0, "sortBy": "rating", "order": "desc"};
    }
  }

  Future<void> fetchProducts() async {
    final Response response;

    if (widget.search.isNotEmpty) {
      response = await dio.get(
        'products/search',
        queryParameters: {..._getSortParams(), 'q': widget.search},
      );
    } else if (widget.selectedCategory != 'All') {
      response = await dio.get(
        "products/category/${widget.selectedCategory}",
        queryParameters: _getSortParams(),
      );
    } else {
      response = await dio.get('products', queryParameters: _getSortParams());
    }

    setState(() {
      products = response.data['products'];
      widget.productsCount(response.data['total']);
    });
  }

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
            return ProductCard(
              title: products[index]['title'],
              price: '\$${products[index]['price']}',
              rating: products[index]['rating'].toString(),
              imageUrl: (products[index]['thumbnail']),
            );
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
