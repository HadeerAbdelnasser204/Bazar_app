import 'package:flutter/material.dart';

class CategoriesTabs extends StatefulWidget {
  const CategoriesTabs({super.key, required this.categories});
  final List<String> categories;

  @override
  State<CategoriesTabs> createState() => _CategoriesTabsState();
}

class _CategoriesTabsState extends State<CategoriesTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        child: Row(
          children: List.generate(widget.categories.length, (index) {
            final isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      widget.categories[index],

                      style: TextStyle(
                        fontSize: 16,

                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,

                        color: isSelected ? Colors.black : Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 5),

                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 3,
                      width: isSelected ? 30 : 0,

                      decoration: BoxDecoration(
                        color: const Color(0xFF54408C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
