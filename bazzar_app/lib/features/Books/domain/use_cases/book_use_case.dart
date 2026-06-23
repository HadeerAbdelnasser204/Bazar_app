import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/Books/domain/repositories/book_details_repository.dart';

class BookUseCase {
  final BooksRepository repository;

  BookUseCase(this.repository);

  Future<List<BookModel>> call() async {
    return await repository.getBooks();
  }

  Future<List<BookModel>> getAllBooks() async {
    return await repository.getAllBooks();
  }
}
