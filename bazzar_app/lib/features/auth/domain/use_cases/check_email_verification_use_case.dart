import 'package:bazzar_app/features/auth/domain/repositories/auth_repository.dart';

class CheckEmailVerifiedUseCase {
  final AuthRepository repository;

  CheckEmailVerifiedUseCase(this.repository);

  Future<bool> call() {
    return repository.checkEmailVerified();
  }
}
