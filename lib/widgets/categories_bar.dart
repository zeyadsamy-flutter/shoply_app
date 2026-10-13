import 'package:flutter/material.dart';
import 'package:shoply/features/data/categories_service.dart';

class CategoriesBar extends StatefulWidget {
  final Function(String) onCategorySelected;
  const CategoriesBar({super.key, required this.onCategorySelected});
  @override
  State<CategoriesBar> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  final CategoriesService _categoriesList = CategoriesService();
  List<String> categories = [];
  Future<void> getCategoryList() async {
    final fetchedCategories = await _categoriesList.getCategoryList();
    setState(() {
      categories = ["All", ...fetchedCategories];
    });
  }

  @override
  initState() {
    super.initState();
    getCategoryList();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onCategorySelected(categories[index].toString());
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
