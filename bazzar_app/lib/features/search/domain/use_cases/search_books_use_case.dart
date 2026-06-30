import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/search/domain/repositories/search_repository.dart';

class SearchBooksUseCase {
  final SearchRepository searchRepo;
  SearchBooksUseCase(this.searchRepo);

  Future<List<BookModel>> call(String query) async {
    return await searchRepo.searchBooks(query);
  }
}
