import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CategoriesBar extends StatefulWidget {
  final Function(String) onCategorySelected;
  const CategoriesBar({super.key, required this.onCategorySelected});
  @override
  State<CategoriesBar> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://dummyjson.com/",
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future getCatergoryList() async {
    final reponse = await dio.get("products/category-list");
    setState(() {
      categories = ["All", ...reponse.data];
    });
  }

  List categories = [];
  void assignCategory() {
    getCatergoryList();
  }

  @override
  initState() {
    super.initState();
    assignCategory();
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
