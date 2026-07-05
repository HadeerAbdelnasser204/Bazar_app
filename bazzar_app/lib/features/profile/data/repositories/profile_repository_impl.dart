import 'package:bazzar_app/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:bazzar_app/features/profile/data/models/profile_model.dart';
import 'package:bazzar_app/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<ProfileModel> getProfile() {
    return remoteDataSource.getProfile();
  }

  @override
  Future<void> saveProfile(ProfileModel profile) {
    return remoteDataSource.saveProfile(profile);
  }

  @override
  Future<void> updateProfile(ProfileModel profile) {
    return remoteDataSource.updateProfile(profile);
  }
}
