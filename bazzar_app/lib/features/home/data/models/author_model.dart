class AuthorModel {
  final String name;
  final String image;
  final String role;

  AuthorModel({required this.name, required this.image, required this.role});
}

List<AuthorModel> dummyAuthors = [
  AuthorModel(
    name: "John Freeman",
    image: "assets/images/App Logo.png",
    role: "Writer",
  ),
  AuthorModel(
    name: "Tess Gunty",
    image: "assets/images/App Logo.png",
    role: "Novelist",
  ),
  AuthorModel(
    name: "Richard Powers",
    image: "assets/images/App Logo.png",
    role: "Writer",
  ),
];
