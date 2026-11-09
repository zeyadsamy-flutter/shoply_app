import 'package:flutter/material.dart';
import 'package:shoply/features/home/controllers/scopes/product_grid_scope.dart';

import 'sort_dropdown.dart';

class ResultsHeader extends StatelessWidget {
  const ResultsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductGridScope.of(context);
    final num count = controller.products.length < controller.viewedCount
        ? controller.products.length
        : controller.viewedCount;
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
              TextSpan(text: ' of ${controller.total} products'),
            ],
          ),
        ),
        SortDropdown(),
      ],
    );
  }
}
