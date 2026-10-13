import 'package:flutter/material.dart';

class ProductsProgressBar extends StatelessWidget {
  final double progress; // قيمة بين 0.0 و 1.0 (Hardcoded)

  const ProductsProgressBar({
    super.key,
    this.progress = 0.15, // تقريباً نفس النسبة الظاهرة في التصميم
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(2),
          ),
          alignment: Alignment.centerLeft,
          child: Container(
            width: constraints.maxWidth * progress,
            decoration: BoxDecoration(
              color: const Color(0xFF00B074), // اللون الأخضر
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      },
    );
  }
}