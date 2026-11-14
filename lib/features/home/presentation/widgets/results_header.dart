import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply/features/home/cubit/product_grid_cubit.dart';

import 'sort_dropdown.dart';

class ResultsHeader extends StatelessWidget {
  const ResultsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final productsLength = context.select(
      (ProductGridCubit cubit) => cubit.state.products.length,
    );
    final viewedCount = context.select(
      (ProductGridCubit cubit) => cubit.state.viewedCount,
    );
    final total = context.select((ProductGridCubit cubit) => cubit.state.total);
    final num count = productsLength < viewedCount
        ? productsLength
        : viewedCount;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            children: [
              const TextSpan(text: 'Showing '),
              TextSpan(
                text: '$count',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextSpan(text: ' of $total products'),
            ],
          ),
        ),
        SortDropdown(),
      ],
    );
  }
}
