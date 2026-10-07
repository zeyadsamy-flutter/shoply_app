import 'package:flutter/material.dart';
import 'load_more_button.dart';
import 'products_progress_bar.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        LoadMoreButton(),
        SizedBox(height: 16),
        ProductsProgressBar(progress: 0.15),
        SizedBox(height: 8),
      ],
    );
  }
}