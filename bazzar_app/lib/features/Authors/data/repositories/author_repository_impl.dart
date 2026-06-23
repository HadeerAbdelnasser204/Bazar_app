import 'package:bazzar_app/features/Authors/data/data_sources/author_remote_data_source.dart';
import 'package:bazzar_app/features/Authors/data/models/author_model.dart';
import 'package:bazzar_app/features/Authors/domain/repositories/author_repository.dart';

class AuthorRepositoryImpl implements AuthorRepository {
  final AuthorRemoteDataSource authorRemoteDataSource;
  AuthorRepositoryImpl(this.authorRemoteDataSource);

  @override
  Future<List<AuthorModel>> getAuthors() {
    return authorRemoteDataSource.getAuthors();
  }
}
