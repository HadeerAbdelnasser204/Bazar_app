import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/favorites/domain/repositories/favorites_repository.dart';

class GetFavoritesUseCase {
  final FavoritesRepository repository;

  GetFavoritesUseCase(this.repository);

  Future<List<BookModel>> call() async {
    return await repository.getFavorites();
  }
}
