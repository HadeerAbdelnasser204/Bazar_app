import 'package:bazzar_app/features/Authors/data/models/author_model_api.dart';
import 'package:dartz/dartz.dart';

abstract class AuthorRepository {
  Future<Either<List<AuthorModelApi>, String>> getAuthors(String category);
}
