import 'package:flutter/material.dart';

import 'load_more_button.dart';
import 'products_progress_bar.dart';

class BottomSection extends StatelessWidget {
  final int viewedCount;
  final int totalCount;
  final VoidCallback onLoadMore;

  const BottomSection({
    super.key,
    required this.viewedCount,
    required this.totalCount,
    required this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LoadMoreButton(
          viewedCount: viewedCount,
          totalCount: totalCount,
          onLoadMore: onLoadMore,
        ),
        SizedBox(height: viewedCount >= totalCount ? 0 : 16),
        const ProductsProgressBar(progress: 0.15),
        const SizedBox(height: 8),
      ],
    );
  }
}
