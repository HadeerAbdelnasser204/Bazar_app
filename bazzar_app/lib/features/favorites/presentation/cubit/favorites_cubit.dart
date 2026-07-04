import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/favorites/domain/use_cases/add_favorite_use_case.dart';
import 'package:bazzar_app/features/favorites/domain/use_cases/get_favorites_use_case.dart';
import 'package:bazzar_app/features/favorites/domain/use_cases/remove_favorite_use_case.dart';
import 'package:bazzar_app/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;

  FavoritesCubit(
    this.addFavoriteUseCase,
    this.removeFavoriteUseCase,
    this.getFavoritesUseCase,
  ) : super(FavoritesInitial());

  final Set<String> favoriteIds = {};

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());

    try {
      final favorites = await getFavoritesUseCase();

      favoriteIds
        ..clear()
        ..addAll(favorites.map((book) => book.id));

      emit(FavoritesLoaded(favorites));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  bool isFavorite(String bookId) {
    return favoriteIds.contains(bookId);
  }

  Future<void> toggleFavorite(BookModel book) async {
    try {
      if (isFavorite(book.id)) {
        await removeFavoriteUseCase(book.id);
      } else {
        await addFavoriteUseCase(book);
      }

      await loadFavorites();
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }
}
