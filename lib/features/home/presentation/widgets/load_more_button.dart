import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply/features/home/cubit/product_grid_cubit.dart';

class LoadMoreButton extends StatelessWidget {
  const LoadMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    final viewedCount = context.select(
      (ProductGridCubit cubit) => cubit.state.viewedCount,
    );
    final total = context.select((ProductGridCubit cubit) => cubit.state.total);
    final ProductGridCubit productGridCubit = context.read<ProductGridCubit>();
    if (viewedCount >= total) {
      return const SizedBox(height: 0);
    }
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: productGridCubit.updateViewedCount,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade200),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        child: const Text(
          'Load more',
          style: TextStyle(
            color: Color(0xFF0F1E36),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
