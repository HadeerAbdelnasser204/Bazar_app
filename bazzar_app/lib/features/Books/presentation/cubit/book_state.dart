import 'package:bazzar_app/features/Books/data/models/book_model.dart';

abstract class BookState {}

final class BookInitial extends BookState {}

final class BookLoading extends BookState {}

final class BookLoaded extends BookState {
  final List<BookModel> books;
  BookLoaded(this.books);
}

final class BookError extends BookState {
  final String message;
  BookError(this.message);
}
