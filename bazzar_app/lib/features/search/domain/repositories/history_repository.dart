abstract class HistoryRepository {
  Future<void> saveSearch(String query);
  List<String> getHistory();
}
