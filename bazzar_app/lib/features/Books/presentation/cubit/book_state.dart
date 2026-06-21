import 'package:bazzar_app/features/Books/data/models/book_model.dart';

abstract class BookState {}

final class BookInitial extends BookState {}

final class BookLoading extends BookState {}

final class BookSuccess extends BookState {
  final List<BookModel> books;
  BookSuccess(this.books);
}

final class AllBooksSuccess extends BookState {
  final List<BookModel> allBooks;
  AllBooksSuccess(this.allBooks);
}

final class BookError extends BookState {
  final String message;
  BookError(this.message);
}
