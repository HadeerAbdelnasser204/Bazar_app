import 'package:bazzar_app/features/profile/data/models/profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRemoteDataSource {
  Future<void> saveProfile(ProfileModel profile) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(profile.toJson());
  }

  Future<ProfileModel> getProfile() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    return ProfileModel.fromJson(doc.data() as Map<String, dynamic>);
  }

  Future<void> updateProfile(ProfileModel profile) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(profile.toJson());
  }
}
