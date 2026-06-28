import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/Books/domain/repositories/book_details_repository.dart';

class GetBooksByCategory {
  final BooksRepository repo;

  GetBooksByCategory(this.repo);

  Future<List<BookModel>> call(String category) {
    return repo.getBooksByCategory(category);
  }
}
