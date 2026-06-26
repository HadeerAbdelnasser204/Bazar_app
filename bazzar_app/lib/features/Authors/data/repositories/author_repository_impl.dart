import 'package:bazzar_app/features/Authors/data/data_sources/author_remote_data_source.dart';
import 'package:bazzar_app/features/Authors/data/models/author_model_api.dart';
import 'package:bazzar_app/features/Authors/domain/repositories/author_repository.dart';
import 'package:dartz/dartz.dart';

class AuthorRepositoryImpl implements AuthorRepository {
  final AuthorRemoteDataSource authorRemoteDataSource;
  AuthorRepositoryImpl(this.authorRemoteDataSource);

  @override
  Future<Either<List<AuthorModelApi>, String>> getAuthors(
    String category,
  ) async {
    try {
      final List<AuthorModelApi> result = await authorRemoteDataSource
          .getAuthors(category);
      return Left(result);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
