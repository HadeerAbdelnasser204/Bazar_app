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
}
