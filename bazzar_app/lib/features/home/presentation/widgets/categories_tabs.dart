import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Authors/presentation/cubit/author_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (contex, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              context.read<AuthorCubit>().fetchAuthors(
                widget.categories[selectedIndex],
              );
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

                      fontWeight: selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,

                      color: selectedIndex == index
                          ? AppColors.grey900
                          : AppColors.grey500,
                    ),
                  ),

                  const SizedBox(height: 5),

                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 3,
                    width: selectedIndex == index ? 30 : 0,

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
