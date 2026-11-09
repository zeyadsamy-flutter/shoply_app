import 'package:flutter/material.dart';
import 'package:shoply/features/home/controllers/scopes/product_grid_scope.dart';
import 'package:shoply/features/home/presentation/widgets/bottom_section.dart';

import 'product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key, });
  @override
  Widget build(BuildContext context) {
    final controller = ProductGridScope.of(context);
    final currentCount = controller.products.length < controller.viewedCount
        ? controller.products.length
        : controller.viewedCount;

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
            return ProductCard(product: controller.products[index]);
          }, childCount: currentCount),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: BottomSection(),
          ),
        ),
      ],
    );
  }
}
