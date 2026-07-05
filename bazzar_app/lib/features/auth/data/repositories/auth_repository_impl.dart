import 'package:bazzar_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:bazzar_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<void> signUp(String email, String password) async {
    await authRemoteDataSource.signUp(email: email, password: password);
  }

  @override
  Future<void> signIn(String email, String password) async {
    await authRemoteDataSource.signIn(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await authRemoteDataSource.signOut();
  }

  @override
  Future<void> sendEmailVerification() {
    return authRemoteDataSource.sendEmailVerification();
  }

  @override
  Future<bool> checkEmailVerified() {
    return authRemoteDataSource.checkEmailVerified();
  }
}
