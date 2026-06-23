import 'package:bazzar_app/features/Books/domain/use_cases/book_use_case.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/book_state.dart';
import 'package:bloc/bloc.dart';

class BookCubit extends Cubit<BookState> {
  final BookUseCase bookUseCase;

  BookCubit(this.bookUseCase) : super(BookInitial());

  Future<void> fetchBooks() async {
    emit(BookLoading());
    try {
      final books = await bookUseCase();
      emit(BookSuccess(books));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }

  Future<void> fetchAllBooks() async {
    emit(BookLoading());
    try {
      final books = await bookUseCase.getAllBooks();
      emit(AllBooksSuccess(books));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }
}
