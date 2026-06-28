import 'package:bazzar_app/features/Authors/domain/repositories/author_repository.dart';
import 'package:bazzar_app/features/Authors/presentation/cubit/author_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorCubit extends Cubit<AuthorState> {
  final AuthorRepository authorRepository;

  AuthorCubit(this.authorRepository) : super(AuthorInitial());

  Future<void> fetchAuthors(String category) async {
    emit(AuthorLoading());

    final result = await authorRepository.getAuthors(category);
    result.fold((l) => emit(AuthorSuccess(l)), (r) => emit(AuthorError(r)));
  }
}
