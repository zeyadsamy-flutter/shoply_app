import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply/core/error/api_error_model.dart';
import 'package:shoply/features/home/cubit/product_grid_cubit.dart';

class ProductsErrorView extends StatelessWidget {
  const ProductsErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final error = context.select((ProductGridCubit cubit) => cubit.state.error);

    final IconData icon = switch (error?.errorType) {
      ApiErrorType.noInternet => Icons.wifi_off_rounded,
      ApiErrorType.timeout => Icons.access_time_rounded,
      ApiErrorType.serverError => Icons.cloud_off_rounded,
      _ => Icons.error_outline_rounded,
    };

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 56, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          Text(error?.message ?? 'حدث خطأ غير متوقع'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final cubit = context.read<ProductGridCubit>();
              cubit.fetchProducts();
              if (cubit.state.categories.isEmpty) {
                cubit.getCategoryList();
              }
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
