import 'package:bazzar_app/features/Books/data/data_sources/books_remote_data_source.dart';
import 'package:bazzar_app/features/categories/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final BooksRemoteDataSource booksRemoteDataSource;

  CategoriesRepositoryImpl(this.booksRemoteDataSource);

  @override
  Future<List<String>> getCategories() async {
    final books = await booksRemoteDataSource.getAllBooks();

    return ['All', ...books.expand((e) => e.categories).toSet()];
  }
}
