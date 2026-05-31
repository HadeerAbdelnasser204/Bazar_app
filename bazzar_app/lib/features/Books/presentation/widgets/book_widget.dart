import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/Books/presentation/screens/book_details_screen.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),

        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => BookDetailsScreen(book: book),
            );
          },

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 125,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.grey200,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(book.image, fit: BoxFit.contain),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                book.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Text(
                '\$${book.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.primary500,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
