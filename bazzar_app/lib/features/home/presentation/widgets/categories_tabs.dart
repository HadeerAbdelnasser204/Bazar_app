import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesTabs extends StatefulWidget {
  const CategoriesTabs({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  final List<String> categories;
  final Function(String) onCategorySelected;

  @override
  State<CategoriesTabs> createState() => _CategoriesTabsState();
}

class _CategoriesTabsState extends State<CategoriesTabs> {
  int currentSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final category = widget.categories[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                currentSelectedIndex = index;
              });
              widget.onCategorySelected(category);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: currentSelectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: currentSelectedIndex == index
                          ? AppColors.grey900
                          : AppColors.grey500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 3,
                    width: currentSelectedIndex == index ? 30 : 0,
                    decoration: BoxDecoration(
                      color: AppColors.primary500,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
