import 'package:bazzar_app/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);
  Future<void> call(String email, String password) async {
    await authRepository.signUp(email, password);
  }
}
