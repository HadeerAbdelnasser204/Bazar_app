import 'package:bazzar_app/core/api/api_constants.dart';
import 'package:bazzar_app/core/api/api_service.dart';
import 'package:bazzar_app/features/Authors/data/models/author_model_api.dart';

class AuthorRemoteDataSource {
  final ApiService apiService;

  AuthorRemoteDataSource({required this.apiService});
  static const Map<String, String> categoryQueries = {
    'All': 'inauthor:a',
    'Poets': 'subject:poetry',
    'Playwrights': 'subject:drama',
    'Novelists': 'subject:fiction',
    'Journalists': 'subject:journalism',
  };

  Future<List<AuthorModelApi>> getAuthors(String category) async {
    final query = categoryQueries[category] ?? categoryQueries['All']!;
    final response = await apiService.get(
      endPoint:
          '${ApiConstants.baseUrl}volumes?q=$query&maxResults=40&key=${ApiConstants.apiKey}',
    );

    return (response['items'] as List)
        .map((e) => AuthorModelApi.fromJson(e))
        .toList();
  }
}
