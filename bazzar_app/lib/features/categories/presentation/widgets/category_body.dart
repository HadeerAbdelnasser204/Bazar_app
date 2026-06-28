import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/book_widget.dart';
import 'package:bazzar_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:bazzar_app/features/categories/presentation/cubit/categories_state.dart';
import 'package:bazzar_app/features/home/presentation/widgets/categories_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.grey500),
            );
          }

          if (state is CategorySuccess) {
            return ListView(
              children: [
                CategoriesTabs(
                  categories: state.categories,
                  selectedCategory: state.selectedCategory,
                  onCategorySelected: (category) {
                    context.read<CategoryCubit>().changeCategory(category);
                  },
                ),
                const SizedBox(height: 15),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.books.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, index) {
                    return BookWidget(
                      book: state.books[index],
                      width: 180,
                      height: 170,
                      boxWidth: double.infinity,
                      titleSize: 16,
                      priceSize: 14,
                    );
                  },
                ),
              ],
            );
          }

          if (state is CategoryError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
