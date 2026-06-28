import 'package:bazzar_app/features/Books/domain/use_cases/get_book_categories_use_case.dart';
import 'package:bazzar_app/features/categories/domain/use_cases/get_categories_use_case.dart';
import 'package:bazzar_app/features/categories/presentation/cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetBooksByCategory getBooksByCategoryUseCase;

  String currentCategory = "All";

  CategoryCubit(this.getCategoriesUseCase, this.getBooksByCategoryUseCase)
    : super(CategoryInitial());

  Future<void> loadInitialData() async {
    emit(CategoryLoading());

    try {
      final categoriesData = await getCategoriesUseCase();

      final books = await getBooksByCategoryUseCase("All");

      emit(
        CategorySuccess(
          books: books,
          categories: categoriesData.categories,
          selectedCategory: "All",
        ),
      );
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  Future<void> changeCategory(String category) async {
    currentCategory = category;

    try {
      final books = await getBooksByCategoryUseCase(category);

      final currentState = state;

      if (currentState is CategorySuccess) {
        emit(
          CategorySuccess(
            books: books,
            categories: currentState.categories,
            selectedCategory: category,
          ),
        );
      }
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
