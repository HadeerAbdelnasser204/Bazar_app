import 'package:shared_preferences/shared_preferences.dart';

class HistoryLocalDataSource {
  static const String key = "recent_searches";
  final SharedPreferences preferences;

  HistoryLocalDataSource(this.preferences);

  List<String> getHistory() {
    return preferences.getStringList(key) ?? [];
  }

  Future<void> saveHistory(String searchTitle) async {
    final history = getHistory();

    history.remove(searchTitle);
    history.insert(0, searchTitle);

    await preferences.setStringList(key, history);
  }

  Future<void> clearHistory() async {
    await preferences.remove(HistoryLocalDataSource.key);
  }
}
