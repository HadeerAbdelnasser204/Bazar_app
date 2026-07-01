import 'package:bazzar_app/features/Books/data/data_sources/books_remote_data_source.dart';
import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/Books/domain/repositories/book_details_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  final BooksRemoteDataSource booksRemoteDataSource;

  BooksRepositoryImpl(this.booksRemoteDataSource);

  @override
  Future<List<BookModel>> getBooks() {
    return booksRemoteDataSource.getBooks();
  }

  @override
  Future<List<BookModel>> getAllBooks() {
    return booksRemoteDataSource.getAllBooks();
  }

  @override
  Future<List<BookModel>> getBooksByCategory(String subject) {
    return booksRemoteDataSource.getBooksByCategory(subject);
  }
}
