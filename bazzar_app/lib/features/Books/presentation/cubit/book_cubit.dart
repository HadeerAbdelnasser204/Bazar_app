import 'package:bazzar_app/features/Books/data/repositories/books_repository_impl.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/book_state.dart';
import 'package:bloc/bloc.dart';

class BookCubit extends Cubit<BookState> {
  final BooksRepositoryImpl booksRepository;

  BookCubit(this.booksRepository) : super(BookInitial());

  Future<void> fetchBooks() async {
    emit(BookLoading());
    try {
      final books = await booksRepository.getBooks();
      emit(BookSuccess(books));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }

  Future<void> fetchAllBooks() async {
    emit(BookLoading());
    try {
      final books = await booksRepository.getAllBooks();
      emit(AllBooksSuccess(books));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }
}
