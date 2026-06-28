import 'package:bazzar_app/core/api/api_constants.dart';
import 'package:bazzar_app/core/api/api_endpoints.dart';
import 'package:bazzar_app/core/api/api_service.dart';
import 'package:bazzar_app/features/Books/data/models/book_model.dart';

class BooksRemoteDataSource {
  final ApiService apiService;

  BooksRemoteDataSource(this.apiService);

  Future<List<BookModel>> getBooks() async {
    final response = await apiService.get(
      endPoint: ApiEndpoints.getBooks,
      queryParameters: {
        'q': 'flutter',
        'maxResults': '5',
        'key': ApiConstants.apiKey,
      },
    );

    return (response['items'] as List)
        .map((e) => BookModel.fromJson(e))
        .toList();
  }

  Future<List<BookModel>> getAllBooks() async {
    final response = await apiService.get(
      endPoint: ApiEndpoints.getBooks,
      queryParameters: {
        'q': 'a',
        'maxResults': '40',
        'key': ApiConstants.apiKey,
      },
    );

    return (response['items'] as List)
        .map((e) => BookModel.fromJson(e))
        .toList();
  }

  Future<List<BookModel>> getBooksByCategory(String subject) async {
    final response = await apiService.get(
      endPoint: ApiEndpoints.getBooks,
      queryParameters: {
        'q': subject == "All" ? "a" : "subject:$subject",
        'key': ApiConstants.apiKey,
        'maxResults': subject == "All" ? 40 : 20,
      },
    );

    final items = response['items'] as List? ?? [];

    return items.map((e) => BookModel.fromJson(e)).toList();
  }
}
