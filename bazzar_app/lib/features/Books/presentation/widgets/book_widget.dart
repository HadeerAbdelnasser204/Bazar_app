// ignore_for_file: must_be_immutable

import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/Books/presentation/screens/book_details_screen.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/book_image_widget.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({
    super.key,
    required this.book,
    this.width = 125,
    this.boxWidth = 140,
    this.height = 150,
    this.titleSize = 14,
    this.priceSize = 12,
  });

  final BookModel book;
  final double width;
  final double boxWidth;

  final double height;
  final double titleSize;
  final double priceSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxWidth,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),

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
              Center(
                child: BookImageWidget(
                  imageName: book.image,
                  width: width,
                  height: height,
                ),
              ),
              AppSpacing.h10,

              Text(
                book.title,
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              AppSpacing.h5,

              Text(
                book.price == 0
                    ? 'Free'
                    : '${book.price}  ${book.currencyCode}',
                style: TextStyle(
                  fontSize: priceSize,
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
