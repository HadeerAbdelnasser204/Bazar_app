import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/features/Authors/data/models/author_model.dart';
import 'package:bazzar_app/features/Authors/presentation/widgets/author_products_widget.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class AuthorDetailsBody extends StatelessWidget {
  const AuthorDetailsBody({
    super.key,
    required this.author,
    required this.iconSize,
  });

  final AuthorModel author;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage(author.image),
                  ),
                  AppSpacing.h10,

                  Text(author.role, style: const TextStyle(fontSize: 16)),
                  AppSpacing.h10,

                  Text(
                    author.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacing.h15,

                  RatingWidget(rate: author.rate, isBook: false, iconSize: 25),
                ],
              ),
            ),
          ),
          AppSpacing.h10,

          Text(
            "About",
            style: const TextStyle(
              fontSize: 19,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSpacing.h10,

          Text(
            author.description,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          AppSpacing.h20,

          Text(
            "Products",
            style: const TextStyle(
              fontSize: 19,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSpacing.h10,

          AuthorProductsWidget(author: author),
        ],
      ),
    );
  }
}
