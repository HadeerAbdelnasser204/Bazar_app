import 'package:bazzar_app/features/search/domain/repositories/history_repository.dart';

class GetSearchHistoryUseCase {
  final HistoryRepository repo;

  GetSearchHistoryUseCase(this.repo);

  List<String> call() {
    return repo.getHistory();
  }
}
