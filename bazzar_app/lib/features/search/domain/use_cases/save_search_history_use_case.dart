import 'package:bazzar_app/features/search/domain/repositories/history_repository.dart';

class SaveSearchUseCase {
  final HistoryRepository repo;

  SaveSearchUseCase(this.repo);

  Future<void> call(String searchTitle) {
    return repo.saveSearch(searchTitle);
  }
}
