import 'package:bazzar_app/features/Authors/data/models/author_model.dart';

abstract class AuthorRemoteDataSource {
  Future<List<AuthorModel>> getAuthors();
}

class AuthorRemoteDataSourceImp extends AuthorRemoteDataSource {
  @override
  Future<List<AuthorModel>> getAuthors() async {
    await Future.delayed(const Duration(seconds: 2));
    return dummyAuthors;
  }
}
