import 'package:bazzar_app/features/categories/data/models/category_model.dart';
import 'package:bazzar_app/features/categories/domain/repositories/categories_repository.dart';

class GetCategoriesUseCase {
  final CategoriesRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<CategoryData> call() {
    return repository.getCategoryData();
  }
}
