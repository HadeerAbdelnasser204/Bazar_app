import 'package:bazzar_app/features/favorites/domain/repositories/favorites_repository.dart';

class RemoveFavoriteUseCase {
  final FavoritesRepository repository;
  RemoveFavoriteUseCase(this.repository);

  Future<void> call(String bookId) async {
    await repository.removeFavorite(bookId);
  }
}
