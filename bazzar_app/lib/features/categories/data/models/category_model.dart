import 'package:bazzar_app/features/Books/data/models/book_model.dart';

class CategoryData {
  final List<BookModel> books;
  final List<String> categories;

  CategoryData({required this.books, required this.categories});
}
