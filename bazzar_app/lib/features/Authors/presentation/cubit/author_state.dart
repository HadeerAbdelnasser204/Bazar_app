import 'package:bazzar_app/features/Authors/data/models/author_model.dart';

abstract class AuthorState {}

class AuthorInitial extends AuthorState {}

class AuthorLoading extends AuthorState {}

class AuthorSuccess extends AuthorState {
  final List<AuthorModel> authors;
  AuthorSuccess(this.authors);
}

class AuthorError extends AuthorState {
  final String message;
  AuthorError(this.message);
}
