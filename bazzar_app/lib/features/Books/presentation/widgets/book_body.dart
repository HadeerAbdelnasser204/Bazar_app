import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/book_cubit.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/book_state.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/book_widget.dart';
import 'package:bazzar_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:bazzar_app/features/categories/presentation/cubit/categories_state.dart';
import 'package:bazzar_app/features/home/presentation/widgets/categories_tabs.dart';
import 'package:bazzar_app/features/home/presentation/widgets/page_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksBody extends StatelessWidget {
  const BooksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: ListView(
        children: [
          const PageDescriptionWidget(
            description: "Our Books",
            subtitle: "Books",
          ),

          const SizedBox(height: 15),

          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategorySuccess) {
                return CategoriesTabs(
                  categories: state.categories,
                  selectedCategory: state.selectedCategory,
                  onCategorySelected: (category) {
                    context.read<CategoryCubit>().changeCategory(category);

                    context.read<BookCubit>().fetchBooksByCategory(category);
                    print("CATEGORY SENT: $category");
                  },
                );
              }

              return const SizedBox();
            },
          ),

          const SizedBox(height: 15),

          BlocBuilder<BookCubit, BookState>(
            builder: (context, state) {
              if (state is BookLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.grey500),
                );
              }

              if (state is BookLoaded) {
                return GridView.builder(
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
                    return BookWidget(book: state.books[index]);
                  },
                );
              }
              if (state is BookError) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
