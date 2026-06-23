import 'package:bazzar_app/features/Authors/data/models/author_model.dart';
import 'package:bazzar_app/features/Authors/domain/repositories/author_repository.dart';

class AuthorUseCase {
  final AuthorRepository repository;

  AuthorUseCase(this.repository);

  Future<List<AuthorModel>> call() async {
    return await repository.getAuthor();
  }
}
