import 'package:bazzar_app/core/utils/app_assets.dart';

class CartItemModel {
  CartItemModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.vendor,
    this.quantity = 1,
  });

  final String id;
  final String title;
  final String image;
  final double price;
  final String vendor;
  int quantity;

  double get lineTotal => price * quantity;
}

List<CartItemModel> dummyCartItems = [
  CartItemModel(
    id: '1',
    title: 'The Kite Runner',
    image: AppAssets.logo,
    price: 14.99,
    vendor: 'Gooday',
    quantity: 1,
  ),
  CartItemModel(
    id: '2',
    title: 'Atomic Habits',
    image: AppAssets.logo,
    price: 18.50,
    vendor: 'Kuromi',
    quantity: 2,
  ),
];
