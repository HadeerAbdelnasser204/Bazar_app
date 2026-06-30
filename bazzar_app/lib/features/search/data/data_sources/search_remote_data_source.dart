import 'package:bazzar_app/core/api/api_constants.dart';
import 'package:bazzar_app/core/api/api_endpoints.dart';
import 'package:bazzar_app/core/api/api_service.dart';
import 'package:bazzar_app/features/Books/data/models/book_model.dart';

class SearchRemoteDataSource {
  final ApiService apiService;
  SearchRemoteDataSource(this.apiService);

  Future<List<BookModel>> searchBooks(String query) async {
    final response = await apiService.get(
      endPoint: ApiEndpoints.getBooks,
      queryParameters: {
        'q': query,
        'key': ApiConstants.apiKey,
        'maxResults': 20,
      },
    );

    final items = response['items'] as List? ?? [];

    return items.map((e) => BookModel.fromJson(e)).toList();
  }

  Future<List<BookModel>> searchBooksByTitle(String title) async {
    final response = await apiService.get(
      endPoint: ApiEndpoints.getBooks,
      queryParameters: {
        'q': 'intitle:$title',
        'key': ApiConstants.apiKey,
        'maxResults': 20,
      },
    );

    final items = response['items'] as List? ?? [];

    return items.map((e) => BookModel.fromJson(e)).toList();
  }
}
