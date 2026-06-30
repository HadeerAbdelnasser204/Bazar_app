import 'package:bazzar_app/features/Books/data/models/book_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<BookModel> books;
  final List<String> history;

  SearchSuccess(this.books, this.history);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
