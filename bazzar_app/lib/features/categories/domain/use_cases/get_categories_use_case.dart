import 'package:bazzar_app/features/categories/domain/repositories/categories_repository.dart';

class GetCategoriesUseCase {
  final CategoriesRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<String>> call() {
    return repository.getCategories();
  }
}
