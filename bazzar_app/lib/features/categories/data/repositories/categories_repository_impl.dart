import 'package:bazzar_app/features/Books/data/data_sources/books_remote_data_source.dart';
import 'package:bazzar_app/features/categories/data/models/category_model.dart';
import 'package:bazzar_app/features/categories/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final BooksRemoteDataSource booksRemoteDataSource;

  CategoriesRepositoryImpl(this.booksRemoteDataSource);

  @override
  Future<CategoryData> getCategoryData() async {
    final books = await booksRemoteDataSource.getAllBooks();

    final categories = ['All', ...books.expand((e) => e.categories).toSet()];

    return CategoryData(books: books, categories: categories);
  }
}
