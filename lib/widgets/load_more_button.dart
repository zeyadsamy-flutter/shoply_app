import 'package:flutter/material.dart';

class LoadMoreButton extends StatelessWidget {
  final int viewedCount;
  final int totalCount;
  final VoidCallback onLoadMore;

  const LoadMoreButton({
    super.key,
    required this.viewedCount,
    required this.totalCount,
    required this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    if (viewedCount >= totalCount) {
      return const SizedBox(height: 0);
    }
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onLoadMore,
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
