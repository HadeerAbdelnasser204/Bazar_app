import 'package:bazzar_app/features/search/data/data_sources/history_local_data_source.dart';
import 'package:bazzar_app/features/search/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl extends HistoryRepository {
  final HistoryLocalDataSource historyLocalDataSource;

  HistoryRepositoryImpl(this.historyLocalDataSource);

  @override
  List<String> getHistory() {
    return historyLocalDataSource.getHistory();
  }

  @override
  Future<void> saveSearch(String searchTitle) async {
    await historyLocalDataSource.saveHistory(searchTitle);
  }
}
