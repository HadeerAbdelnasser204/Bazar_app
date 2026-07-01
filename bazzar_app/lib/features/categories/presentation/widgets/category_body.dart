import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/book_cubit.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/book_state.dart';
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
        builder: (context, categoryState) {
          if (categoryState is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.grey500),
            );
          }

          if (categoryState is CategorySuccess) {
            return Column(
              children: [
                CategoriesTabs(
                  categories: categoryState.categories,
                  onCategorySelected: (category) {
                    context.read<CategoryCubit>().changeCategory(category);

                    context.read<BookCubit>().fetchBooksByCategory(category);
                  },
                ),

                const SizedBox(height: 15),

                Expanded(
                  child: BlocBuilder<BookCubit, BookState>(
                    builder: (context, bookState) {
                      if (bookState is BookLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.grey500,
                          ),
                        );
                      }
                      if (bookState is BookLoaded) {
                        return GridView.builder(
                          itemCount: bookState.books.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                                childAspectRatio: 0.6,
                              ),
                          itemBuilder: (context, index) {
                            return BookWidget(
                              book: bookState.books[index],
                              width: 180,
                              height: 170,
                              boxWidth: double.infinity,
                              titleSize: 16,
                              priceSize: 14,
                            );
                          },
                        );
                      }

                      if (bookState is BookError) {
                        return Center(
                          child: Text(
                            bookState.message,
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            );
          }

          if (categoryState is CategoryError) {
            return Center(
              child: Text(
                categoryState.message,
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
