import 'package:bazzar_app/features/profile/data/models/profile_model.dart';
import 'package:bazzar_app/features/profile/domain/repositories/profile_repository.dart';

class SaveProfileUseCase {
  final ProfileRepository repository;

  SaveProfileUseCase(this.repository);

  Future<void> call(ProfileModel profile) {
    return repository.saveProfile(profile);
  }
}
