import 'package:flutter/material.dart';

import 'sort_dropdown.dart';

class ResultsHeader extends StatelessWidget {
  final int viewedCount;
  final int total;
  final ValueChanged<String> onSelected;
  final String selectedOption;
  const ResultsHeader({
    super.key,
    required this.total,
    required this.viewedCount,
    required this.selectedOption,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final int count = viewedCount > total ? total : viewedCount;
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
        SortDropdown(selectedOption: selectedOption, onSelected: onSelected),
      ],
    );
  }
}
