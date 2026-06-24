import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/Books/domain/repositories/book_details_repository.dart';

class GetBookUseCase {
  final BooksRepository repository;

  GetBookUseCase(this.repository);

  Future<List<BookModel>> call() async {
    return await repository.getBooks();
  }
}
