// import 'package:bazzar_app/core/utils/app_assets.dart';
class BookModel {
  final String id;
  final String title;
  final List<String> authors;
  final List<String> categories;
  final String image;
  final double price;
  final double rate;
  final String vendor;
  final String puplisher;
  final String description;

  BookModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.categories,
    required this.image,
    this.price = 39.99,
    this.rate = 3,
    required this.vendor,
    required this.puplisher,
    required this.description,
  });

  factory BookModel.fromJson(Map<String, dynamic> response) {
    final volumeInfo = response['volumeInfo'] ?? {};
    return BookModel(
      id: response['id'] ?? '',
      title: volumeInfo['title'] ?? '',
      authors: List<String>.from(volumeInfo['authors'] ?? []),
      categories: List<String>.from(volumeInfo['categories'] ?? []),

      image: volumeInfo['imageLinks']?['thumbnail'] ?? '',

      price: 39.99,
      rate: 3,

      vendor: volumeInfo['publisher'] ?? '',
      puplisher: volumeInfo['publisher'] ?? '',

      description: volumeInfo['description'] ?? '',
    );
  }
}
