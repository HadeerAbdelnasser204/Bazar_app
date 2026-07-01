import 'package:bazzar_app/features/search/domain/use_cases/get_search_history_use_case.dart';
import 'package:bazzar_app/features/search/domain/use_cases/save_search_history_use_case.dart';
import 'package:bazzar_app/features/search/domain/use_cases/search_books_by_title_use_case.dart';
import 'package:bazzar_app/features/search/domain/use_cases/search_books_use_case.dart';
import 'package:bazzar_app/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchBooksUseCase searchBooksUseCase;
  final SearchBooksByTitleUseCase searchBooksByTitleUseCase;
  final GetSearchHistoryUseCase getHistoryUseCase;
  final SaveSearchUseCase saveSearchUseCase;

  SearchCubit(
    this.searchBooksUseCase,
    this.searchBooksByTitleUseCase,
    this.getHistoryUseCase,
    this.saveSearchUseCase,
  ) : super(SearchInitial());

  List<String> history = [];

  void loadHistory() {
    history = getHistoryUseCase();
    emit(SearchInitial());
  }

  Future<void> searchBooks(String query) async {
    emit(SearchLoading());

    try {
      // await saveSearchUseCase(query);
      history = getHistoryUseCase();

      final books = await searchBooksUseCase(query);
      emit(SearchSuccess(books, history));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  Future<void> searchBooksByTitle(String title) async {
    emit(SearchLoading());

    try {
      await saveSearchUseCase(title);
      history = getHistoryUseCase();

      final books = await searchBooksByTitleUseCase(title);
      emit(SearchSuccess(books, history));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
