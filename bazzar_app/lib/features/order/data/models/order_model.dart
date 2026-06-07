import 'package:bazzar_app/features/Books/data/models/book_model.dart';

class OrderModel {
  final BookModel book;
  final String status;
  final int orderQuantity;

  OrderModel({
    required this.book,
    required this.status,
    required this.orderQuantity,
  });
}

final List<OrderModel> dummyOrders = [
  OrderModel(book: dummyBooks[0], status: "Delivered", orderQuantity: 1),
  OrderModel(book: dummyBooks[1], status: "Cancelled", orderQuantity: 2),
  OrderModel(book: dummyBooks[2], status: "Pending", orderQuantity: 5),
];
