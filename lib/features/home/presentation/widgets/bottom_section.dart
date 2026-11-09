import 'package:flutter/material.dart';
import 'package:shoply/features/home/controllers/scopes/product_grid_scope.dart';

import 'load_more_button.dart';
import 'products_progress_bar.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductGridScope.read(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LoadMoreButton(),
        SizedBox(height: controller.viewedCount >= controller.total ? 0 : 16),
        ProductsProgressBar(
          progress: controller.total == 0
              ? 0
              : (controller.viewedCount / controller.total).clamp(0.0, 1.0),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
