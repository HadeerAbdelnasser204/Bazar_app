import 'dart:io';

import 'package:bazzar_app/features/profile/domain/repositories/profile_repository.dart';

class UploadProfileImageUseCase {
  final ProfileRepository repository;

  UploadProfileImageUseCase(this.repository);

  Future<String> call(File image) {
    return repository.uploadProfileImage(image);
  }
}
