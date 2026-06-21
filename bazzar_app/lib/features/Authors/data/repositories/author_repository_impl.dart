import 'package:bazzar_app/features/Authors/data/data_sources/author_remote_data_source.dart';
import 'package:bazzar_app/features/Authors/data/models/author_model.dart';

class AuthorRepositoryImpl {
  final AuthorRemoteDataSource authorRemoteDataSource;
  AuthorRepositoryImpl(this.authorRemoteDataSource);

  Future<List<AuthorModel>> getAuthors() {
    return authorRemoteDataSource.getAuthors();
  }
}
