import 'package:flutter/material.dart';
import 'package:shoply/features/home/controllers/scopes/product_grid_scope.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = ProductGridScope.of(context);
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected =
              controller.selectedCategory == controller.categories[index];
          return GestureDetector(
            onTap: () {
              controller.selectCategory(controller.categories[index]);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF0F1E36) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Colors.transparent : Colors.grey.shade200,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                controller.categories[index].toString(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey.shade700,
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
