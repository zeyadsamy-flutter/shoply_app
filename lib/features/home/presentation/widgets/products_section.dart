import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply/features/home/cubit/product_grid_cubit.dart';
import 'package:shoply/features/home/cubit/product_grid_state.dart';
import 'package:shoply/features/home/presentation/widgets/products_empty_view.dart';
import 'package:shoply/features/home/presentation/widgets/products_error_view.dart';
import 'package:shoply/features/home/presentation/widgets/products_grid.dart';
import 'package:shoply/features/home/presentation/widgets/products_loading_view.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select(
      (ProductGridCubit cubit) => cubit.state.status,
    );
    final isEmpty = context.select(
      (ProductGridCubit cubit) => cubit.state.products.isEmpty,
    );

    return switch (status) {
      ProductStatus.initial ||
      ProductStatus.loading => const ProductsLoadingView(),
      ProductStatus.failure => const ProductsErrorView(),
      ProductStatus.success =>
        isEmpty
            ? const ProductsEmptyView()
            : const ProductsGrid(), // ملفك القديم من غير ما نلمسه!
    };
  }
}
