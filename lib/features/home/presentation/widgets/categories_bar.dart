import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply/features/home/cubit/product_grid_cubit.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({super.key});
  @override
  Widget build(BuildContext context) {
    final categories = context.select(
      (ProductGridCubit cubit) => cubit.state.categories,
    );
    final selectedCategory = context.select(
      (ProductGridCubit cubit) => cubit.state.selectedCategory,
    );
    final ProductGridCubit productGridCubit = context.read<ProductGridCubit>();
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected =
              selectedCategory ==
              categories[index];
          return GestureDetector(
            onTap: () {
              productGridCubit.selectCategory(
                categories[index],
              );
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
                categories[index].toString(),
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
