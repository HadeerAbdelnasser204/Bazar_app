import 'package:bazzar_app/features/Books/data/models/book_model.dart';

abstract class BooksRepository {
  Future<List<BookModel>> getBooks();

  Future<List<BookModel>> getAllBooks();

  Future<List<BookModel>> getBooksByCategory(String subject);
}
