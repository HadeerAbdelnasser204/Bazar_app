import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/favorites/data/data_sources/favorites_remote_data_source.dart';
import 'package:bazzar_app/features/favorites/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl extends FavoritesRepository {
  final FavoriteRemoteDataSource remoteDataSource;

  FavoritesRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<BookModel>> getFavorites() {
    return remoteDataSource.getFavorites();
  }

  @override
  Future<void> addFavorite(BookModel book) {
    return remoteDataSource.addFavorite(book);
  }

  @override
  Future<void> removeFavorite(String bookId) {
    return remoteDataSource.removeFavorite(bookId);
  }
}
