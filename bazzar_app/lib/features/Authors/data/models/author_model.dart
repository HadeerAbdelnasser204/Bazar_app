import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/Books/data/models/book_model.dart';

class AuthorModel {
  final String name;
  final String image;
  final String role;
  final String description;
  final double rate;

  final List<BookModel> products;

  AuthorModel({
    required this.name,
    required this.image,
    required this.role,
    required this.description,
    required this.rate,
    required this.products,
  });
}

List<AuthorModel> dummyAuthors = [
  AuthorModel(
    name: "John Freeman",
    image: AppAssets.logo,
    role: "Writer",
    description: "John Freeman is a writer and editor based in New York.",
    rate: 4.0,
    products: [
      BookModel(
        title: "The Tyranny of Email",
        image: AppAssets.logo,
        price: 19.99,
        rate: 4.5,
        vendor: "Penguin",
        description: "A book about how email changed communication.",
      ),

      BookModel(
        title: "Dictionary of the Undoing",
        image: AppAssets.logo,
        price: 24.99,
        rate: 4.2,
        vendor: "HarperCollins",
        description: "Essays and reflections on modern society.",
      ),

      BookModel(
        title: "The Tyranny of Email",
        image: AppAssets.logo,
        price: 19.99,
        rate: 4.0,
        vendor: "Penguin",
        description: "A book about how email changed communication.",
      ),

      BookModel(
        title: "Dictionary of the Undoing",
        image: AppAssets.logo,
        price: 24.99,
        rate: 3.0,
        vendor: "HarperCollins",
        description: "Essays and reflections on modern society.",
      ),
    ],
  ),

  AuthorModel(
    name: "Tess Gunty",
    image: AppAssets.logo,
    role: "Novelist",
    description:
        "Tess Gunty is a novelist and short story writer based in California.",
    rate: 4.0,
    products: [
      BookModel(
        title: "The Rabbit Hutch",
        image: AppAssets.logo,
        price: 29.99,
        rate: 3.8,
        vendor: "Simon & Schuster",
        description: "An award-winning modern novel.",
      ),

      BookModel(
        title: "After the Flood",

        image: AppAssets.logo,

        price: 21.50,

        rate: 5.0,

        vendor: "Vintage",

        description: "A dramatic fictional journey after a disaster.",
      ),
    ],
  ),

  AuthorModel(
    name: "Richard Powers",

    image: AppAssets.logo,

    role: "Writer",

    description: "Richard Powers is a writer and editor based in Illinois.",

    rate: 4.3,

    products: [
      BookModel(
        title: "The Overstory",

        image: AppAssets.logo,

        price: 26.99,

        rate: 4.9,

        vendor: "W.W. Norton",

        description: "A novel connecting human lives with trees.",
      ),

      BookModel(
        title: "Bewilderment",

        image: AppAssets.logo,

        price: 23.99,

        rate: 4.6,

        vendor: "Random House",

        description: "A touching story about family and science.",
      ),
    ],
  ),
];
