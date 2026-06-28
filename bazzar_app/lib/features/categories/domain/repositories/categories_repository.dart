import 'package:bazzar_app/features/categories/data/models/category_model.dart';

abstract class CategoriesRepository {
  Future<CategoryData> getCategoryData();
}
