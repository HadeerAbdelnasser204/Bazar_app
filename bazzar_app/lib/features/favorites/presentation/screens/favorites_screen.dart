import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/book_image_widget.dart';
import 'package:bazzar_app/features/favorites/presentation/widgets/favorite_book_section.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: "Your Favorites",
        leadingIconPath: AppAssets.arrowBackIcon,
        leadingOnPressed: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: FavoriteBookSection(book: dummyBooks[0]),
            ),
            Divider(thickness: 1, color: AppColors.grey300),
          ],
        ),
      ),
    );
  }
}
