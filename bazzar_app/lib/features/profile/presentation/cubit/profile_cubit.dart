import 'dart:io';

import 'package:bazzar_app/features/profile/data/models/profile_model.dart';
import 'package:bazzar_app/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:bazzar_app/features/profile/domain/use_cases/save_profile_use_case.dart';
import 'package:bazzar_app/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:bazzar_app/features/profile/domain/use_cases/upload_profile_image_use_case.dart';
import 'package:bazzar_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final SaveProfileUseCase saveProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final UploadProfileImageUseCase uploadProfileImageUseCase;

  ProfileCubit(
    this.getProfileUseCase,
    this.saveProfileUseCase,
    this.updateProfileUseCase,
    this.uploadProfileImageUseCase,
  ) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());

    try {
      final profile = await getProfileUseCase();
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> saveProfile(ProfileModel profile) async {
    emit(ProfileLoading());

    try {
      await saveProfileUseCase(profile);
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile(ProfileModel profile) async {
    emit(ProfileLoading());

    try {
      await updateProfileUseCase(profile);
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> changeProfileImage() async {
    final picker = ImagePicker();

    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (pickedImage == null) return;

    emit(ProfileLoading());

    try {
      await uploadProfileImageUseCase(File(pickedImage.path));

      await loadProfile();
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
