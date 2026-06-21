import 'package:bazzar_app/features/Authors/data/repositories/author_repository_impl.dart';
import 'package:bazzar_app/features/Authors/presentation/cubit/author_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorCubit extends Cubit<AuthorState> {
  final AuthorRepositoryImpl auterRepository;
  AuthorCubit(this.auterRepository) : super(AuthorInitial());

  Future<void> fetchAuthors() async {
    emit(AuthorLoading());
    await Future.delayed(const Duration(seconds: 2));

    try {
      final authors = await auterRepository.getAuthors();
      emit(AuthorSuccess(authors));
    } catch (e) {
      emit(AuthorError(e.toString()));
    }
  }
}
