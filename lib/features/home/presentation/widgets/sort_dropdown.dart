import 'package:flutter/material.dart';

class SortDropdown extends StatelessWidget {
  const SortDropdown({
    super.key,
    required this.selectedOption,
    required this.onSelected,
  });
  final String selectedOption;
  final ValueChanged<String> onSelected;
  final List<String> sortOptions = const [
    'Recommended',
    'Price: Low to High',
    'Price: High to Low',
    'Title: A-Z',
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: PopupMenuButton<String>(
        initialValue: selectedOption,
        offset: const Offset(0, 36),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Colors.grey.shade400, width: 0.8),
        ),
        color: Colors.white,
        padding: EdgeInsets.zero,
        onSelected: (String value) {
          onSelected(value);
        },
        itemBuilder: (BuildContext context) {
          return sortOptions.map((String option) {
            final isSelected = option == selectedOption;
            return PopupMenuItem<String>(
              value: option,
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF1E66D5)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 13,
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.swap_vert, size: 16, color: Color(0xFF00B074)),
              const SizedBox(width: 4),
              Text(
                selectedOption,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F1E36),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
