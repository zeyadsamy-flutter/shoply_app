import 'package:flutter/material.dart';
import 'package:shoply/features/home/controllers/scopes/product_grid_scope.dart';

class LoadMoreButton extends StatelessWidget {
  const LoadMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductGridScope.read(context);
    if (controller.viewedCount >= controller.total) {
      return const SizedBox(height: 0);
    }
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: controller.updateViewedCount,
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
