import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bazzar_app/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepositoryImpl(this.searchRemoteDataSource);

  @override
  Future<List<BookModel>> searchBooks(String query) async {
    return await searchRemoteDataSource.searchBooks(query);
  }

  @override
  Future<List<BookModel>> searchBooksByTitle(String query) async {
    return await searchRemoteDataSource.searchBooksByTitle(query);
  }
}
