import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply/features/home/cubit/product_grid_cubit.dart';
import 'package:shoply/features/home/presentation/widgets/bottom_section.dart';

import 'product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});
  @override
  Widget build(BuildContext context) {
    final products = context.select(
      (ProductGridCubit cubit) => cubit.state.products,
    );
    final viewedCount = context.select(
      (ProductGridCubit cubit) => cubit.state.viewedCount,
    );
    final currentCount = products.length < viewedCount
        ? products.length
        : viewedCount;

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
            child: BottomSection(),
          ),
        ),
      ],
    );
  }
}
