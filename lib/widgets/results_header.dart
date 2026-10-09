import 'package:flutter/material.dart';

import 'sort_dropdown.dart';

class ResultsHeader extends StatelessWidget {
  final int viewedCount;
  final int total;

  const ResultsHeader({
    super.key,
    required this.total,
    required this.viewedCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            children: [
              const TextSpan(text: 'Showing '),
              TextSpan(
                text: '$viewedCount',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextSpan(text: ' of $total products'),
            ],
          ),
        ),
        const SortDropdown(),
      ],
    );
  }
}