import 'package:flutter/material.dart';

class LoadMoreButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const LoadMoreButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed ?? () {},
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