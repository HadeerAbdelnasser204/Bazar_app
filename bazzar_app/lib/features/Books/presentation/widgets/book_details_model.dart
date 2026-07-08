import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/book_image_widget.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/custom_elevated_button.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/quantity_selector.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/rating_widget.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/show_model_line.dart';
import 'package:bazzar_app/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:bazzar_app/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

              Center(
                child: BookImageWidget(
                  imageColor: AppColors.grey200,
                  imageName: book.image,
                  height: 250,
                  width: 200,
                  radius: 20,
                ),
              ),
              AppSpacing.h20,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      book.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  BlocBuilder<FavoritesCubit, FavoritesState>(
                    builder: (context, state) {
                      final cubit = context.read<FavoritesCubit>();
                      final isFav = cubit.isFavorite(book.id);

                      return IconButton(
                        onPressed: () {
                          cubit.toggleFavorite(book);
                        },
                        icon: SvgPicture.asset(
                          AppAssets.loveIcon,
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            isFav ? AppColors.primary500 : AppColors.grey500,
                            BlendMode.srcIn,
                          ),
                        ),
                      );
                    },
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
                book.subtitle == ''
                    ? "No Description Available"
                    : book.subtitle,
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
                price: book.price,
                currencyCode: book.currencyCode,
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
