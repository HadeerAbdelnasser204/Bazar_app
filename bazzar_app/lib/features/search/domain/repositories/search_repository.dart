import 'package:bazzar_app/features/Books/data/models/book_model.dart';

abstract class SearchRepository {
  Future<List<BookModel>> searchBooks(String query);

  Future<List<BookModel>> searchBooksByTitle(String query);
}
