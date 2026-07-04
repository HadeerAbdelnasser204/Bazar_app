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
  final String subtitle;
  final String currencyCode;

  BookModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.categories,
    required this.image,
    required this.price,
    this.rate = 3,
    required this.vendor,
    required this.puplisher,
    required this.description,
    required this.subtitle,
    required this.currencyCode,
  });

  factory BookModel.fromJson(Map<String, dynamic> response) {
    final volumeInfo = response['volumeInfo'] ?? {};

    return BookModel(
      id: response['id'] ?? '',
      title: volumeInfo['title'] ?? '',
      authors: List<String>.from(volumeInfo['authors'] ?? []),
      categories: List<String>.from(volumeInfo['categories'] ?? []),

      image: volumeInfo['imageLinks']?['thumbnail'] ?? '',

      price: (response['saleInfo']?['retailPrice']?['amount'] ?? 0),
      currencyCode: response['saleInfo']?['retailPrice']?['currencyCode'] ?? '',
      rate: 3,

      vendor: volumeInfo['publisher'] ?? '',
      puplisher: volumeInfo['publisher'] ?? '',

      subtitle: volumeInfo['subtitle'] ?? '',
      description: volumeInfo['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'volumeInfo': {
        'title': title,
        'authors': authors,
        'categories': categories,
        'imageLinks': {'thumbnail': image},
        'publisher': puplisher,
        'subtitle': subtitle,
        'description': description,
      },
      'saleInfo': {
        'retailPrice': {'amount': price, 'currencyCode': currencyCode},
      },
      'rate': rate,
      'vendor': vendor,
    };
  }
}
