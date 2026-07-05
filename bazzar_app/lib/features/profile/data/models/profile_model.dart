class ProfileModel {
  final String uid;

  final String name;
  final String email;
  final String phone;
  final String imageUrl;

  ProfileModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.uid,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      uid: json['uid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'imageUrl': imageUrl,
      'uid': uid,
    };
  }
}
