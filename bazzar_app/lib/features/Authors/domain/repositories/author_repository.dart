import 'package:bazzar_app/features/Authors/data/models/author_model.dart';

abstract class AuthorRepository {
  Future<List<AuthorModel>> getAuthors();
}
