import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Authors/data/models/author_model.dart';
import 'package:flutter/material.dart';

class AuthorProductsWidget extends StatelessWidget {
  const AuthorProductsWidget({super.key, required this.author});

  final AuthorModel author;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.71,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(author.products.length, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.circular(20),
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    author.products[index].image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                author.products[index].title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "\$${author.products[index].price}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primary500,
              ),
            ),
          ],
        );
      }),
    );
  }
}
