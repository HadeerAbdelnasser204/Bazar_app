import 'package:bazzar_app/features/Authors/domain/use_cases/author_use_case.dart';
import 'package:bazzar_app/features/Authors/presentation/cubit/author_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorCubit extends Cubit<AuthorState> {
  final AuthorUseCase authorUseCase;
  AuthorCubit(this.authorUseCase) : super(AuthorInitial());

  Future<void> fetchAuthors() async {
    emit(AuthorLoading());
    await Future.delayed(const Duration(seconds: 2));

    try {
      final authors = await authorUseCase();
      emit(AuthorSuccess(authors));
    } catch (e) {
      emit(AuthorError(e.toString()));
    }
  }
}
