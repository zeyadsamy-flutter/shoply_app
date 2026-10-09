import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'product_card.dart';

class ProductsGrid extends StatefulWidget {
  final String selectedCategory;
  final Function(int) productsCount;
  final int viewedCount;
  const ProductsGrid({
    super.key,
    required this.selectedCategory,
    required this.productsCount,
    required this.viewedCount,
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

  Future<void> fetchProducts() async {
    final response = widget.selectedCategory == 'All'
        ? await dio.get('products', queryParameters: {"limit": 0})
        : await dio.get(
            "products/category/${widget.selectedCategory}",
            queryParameters: {"limit": 0},
          );

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
    if (oldWidget.selectedCategory != widget.selectedCategory) {
      fetchProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.68,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: products.length < widget.viewedCount
          ? products.length
          : widget.viewedCount,
      itemBuilder: (context, index) {
        return ProductCard(
          title: products[index]['title'],
          price: '\$${products[index]['price']}',
          rating: products[index]['rating'].toString(),
          imageUrl: (products[index]['thumbnail']),
        );
      },
    );
  }
}
