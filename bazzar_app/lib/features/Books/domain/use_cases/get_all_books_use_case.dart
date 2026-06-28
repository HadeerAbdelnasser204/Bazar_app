import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/Books/domain/repositories/book_details_repository.dart';

class GetAllBooksUseCase {
  final BooksRepository repository;

  GetAllBooksUseCase(this.repository);

  Future<List<BookModel>> call(String category) async {
    return await repository.getAllBooks();
  }
}
