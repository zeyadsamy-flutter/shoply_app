import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply/features/home/cubit/product_grid_cubit.dart';

import 'load_more_button.dart';
import 'products_progress_bar.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewedCount = context.select(
      (ProductGridCubit cubit) => cubit.state.viewedCount,
    );
    final total = context.select((ProductGridCubit cubit) => cubit.state.total);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LoadMoreButton(),
        SizedBox(height: viewedCount >= total ? 0 : 16),
        ProductsProgressBar(
          progress: total == 0 ? 0 : (viewedCount / total).clamp(0.0, 1.0),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
