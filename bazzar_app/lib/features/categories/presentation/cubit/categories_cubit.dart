import 'package:bazzar_app/features/categories/domain/use_cases/get_categories_use_case.dart';
import 'package:bazzar_app/features/categories/presentation/cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  String currentCategory = "All";

  CategoryCubit(this.getCategoriesUseCase) : super(CategoryInitial());

  Future<void> loadInitialData() async {
    emit(CategoryLoading());

    try {
      final categories = await getCategoriesUseCase();

      emit(CategorySuccess(categories: categories, selectedCategory: "All"));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  void changeCategory(String category) {
    currentCategory = category;

    final currentState = state;

    if (currentState is CategorySuccess) {
      emit(
        CategorySuccess(
          categories: currentState.categories,
          selectedCategory: category,
        ),
      );
    }
  }
}
