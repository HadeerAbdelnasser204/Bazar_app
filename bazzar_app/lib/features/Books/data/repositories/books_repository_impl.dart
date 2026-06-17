import 'package:bazzar_app/features/Books/data/data_sources/books_remote_data_source.dart';
import 'package:bazzar_app/features/Books/data/models/book_model.dart';

class BooksRepositoryImpl {
  final BooksRemoteDataSource booksRemoteDataSource;

  BooksRepositoryImpl(this.booksRemoteDataSource);

  Future<List<BookModel>> getBooks() {
    return booksRemoteDataSource.getBooks();
  }
}
