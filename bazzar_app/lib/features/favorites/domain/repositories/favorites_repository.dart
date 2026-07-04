import 'package:bazzar_app/features/Books/data/models/book_model.dart';

abstract class FavoritesRepository {
  Future<List<BookModel>> getFavorites();
  Future<void> addFavorite(BookModel book);
  Future<void> removeFavorite(String bookId);
}
