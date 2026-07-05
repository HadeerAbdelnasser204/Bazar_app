import 'package:bazzar_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<void> call(String email, String password) async {
    await authRepository.signIn(email, password);
  }
}
