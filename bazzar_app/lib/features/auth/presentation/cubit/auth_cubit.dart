import 'package:bazzar_app/features/auth/domain/use_cases/check_email_verification_use_case.dart';
import 'package:bazzar_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:bazzar_app/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:bazzar_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:bazzar_app/features/auth/domain/use_cases/send_email_verification_use_case.dart';
import 'package:bazzar_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final SendEmailVerificationUseCase sendEmailVerificationUseCase;
  final CheckEmailVerifiedUseCase checkEmailVerifiedUseCase;

  AuthCubit(
    this.registerUseCase,
    this.loginUseCase,
    this.logoutUseCase,
    this.sendEmailVerificationUseCase,
    this.checkEmailVerifiedUseCase,
  ) : super(AuthInitial());

  Future<void> register(String email, String password) async {
    emit(AuthLoading());

    try {
      await registerUseCase(email, password);

      if (isClosed) return;
      emit(AuthSuccess());
    } catch (e) {
      if (isClosed) return;
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      await loginUseCase(email, password);

      if (isClosed) return;
      emit(AuthSuccess());
    } catch (e) {
      if (isClosed) return;
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await logoutUseCase();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> resendVerificationEmail() async {
    try {
      await sendEmailVerificationUseCase();
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<bool> checkEmailVerified() async {
    try {
      return await checkEmailVerifiedUseCase();
    } catch (e) {
      emit(AuthFailure(e.toString()));
      return false;
    }
  }
}
