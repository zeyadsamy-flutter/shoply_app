import 'package:flutter/material.dart';

import 'sort_dropdown.dart';

class ResultsHeader extends StatelessWidget {
  const ResultsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 12, color: Colors.grey),
            children: [
              TextSpan(text: 'Showing '),
              TextSpan(
                text: '8',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextSpan(text: ' of 194 products'),
            ],
          ),
        ),
        const SortDropdown(),
      ],
    );
  }
}
