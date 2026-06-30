import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/search/domain/repositories/search_repository.dart';

class SearchBooksByTitleUseCase {
  final SearchRepository searchRepository;
  SearchBooksByTitleUseCase(this.searchRepository);

  Future<List<BookModel>> call(String title) async {
    return await searchRepository.searchBooksByTitle(title);
  }
}
