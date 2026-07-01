abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<String> categories;
  final String selectedCategory;

  CategorySuccess({required this.categories, required this.selectedCategory});
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);
}
