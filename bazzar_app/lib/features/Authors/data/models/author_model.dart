import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/Books/data/models/book_model.dart';

class AuthorModel {
  final String name;
  final String image;
  final String role;
  final String description;
  final double rate;

  AuthorModel({
    required this.name,
    required this.image,
    required this.role,
    required this.description,
    required this.rate,
  });
}

List<AuthorModel> dummyAuthors = [
  AuthorModel(
    name: "John Freeman",
    image: AppAssets.logo,
    role: "Writer",
    description: "John Freeman is a writer and editor based in New York.",
    rate: 4.0,
  ),

  AuthorModel(
    name: "Tess Gunty",
    image: AppAssets.logo,
    role: "Novelist",
    description:
        "Tess Gunty is a novelist and short story writer based in California.",
    rate: 4.0,
  ),

  AuthorModel(
    name: "Richard Powers",

    image: AppAssets.logo,

    role: "Writer",

    description: "Richard Powers is a writer and editor based in Illinois.",

    rate: 4.3,
  ),
];
