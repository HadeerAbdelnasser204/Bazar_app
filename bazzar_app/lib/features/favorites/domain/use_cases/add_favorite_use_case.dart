import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/favorites/domain/repositories/favorites_repository.dart';

class AddFavoriteUseCase {
  final FavoritesRepository repository;

  AddFavoriteUseCase(this.repository);

  Future<void> call(BookModel book) async {
    await repository.addFavorite(book);
  }
}
