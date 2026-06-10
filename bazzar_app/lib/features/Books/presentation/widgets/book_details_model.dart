import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/book_image_widget.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/custom_elevated_button.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/quantity_selector.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/rating_widget.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/show_model_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookDetailsModel extends StatelessWidget {
  const BookDetailsModel({
    super.key,
    required this.iconSize,
    required this.book,
  });

  final double iconSize;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: ShowModelLine()),

              BookImageWidget(
                imageColor: AppColors.grey200,
                imageName: book.image,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    book.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppAssets.loveIcon,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
              Text(
                book.vendor,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpacing.h10,
              Text(
                book.description,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              AppSpacing.h25,
              Text(
                "Review",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              RatingWidget(isBook: true, iconSize: iconSize, rate: book.rate),
              AppSpacing.h40,

              QuantitySelector(
                minusButtonColor: AppColors.grey200,
                plusButtonColor: AppColors.primary500,
              ),
              AppSpacing.h25,

              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {},
                      backgroundColor: AppColors.primary500,
                      title: "Continue Shopping",
                      titleColor: AppColors.primary50,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {},
                      title: "View Cart",
                      backgroundColor: AppColors.grey200,
                      titleColor: AppColors.primary500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
