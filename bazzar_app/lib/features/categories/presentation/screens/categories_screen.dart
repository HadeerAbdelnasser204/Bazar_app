import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/book_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/bottom_navigation_Bar_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/categories_tabs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        title: 'Category',
        iconPath: AppAssets.notificationIcon,
        leadingIconPath: AppAssets.searchIcon,
        leadingOnPressed: () {
          context.go(AppRoutes.searchScreen);
        },
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: ListView(
          children: [
            CategoriesTabs(
              categories: ["All", "Novels", "Self Love", "Science", "Romantic"],
            ),
            AppSpacing.h15,
            // GridView.builder(
            //   itemCount: dummyBooks.length,
            //   itemBuilder: (context, index) {
            //     return BookWidget(
            //       book: dummyBooks[index],
            //       width: 180,
            //       height: 180,
            //       boxWidth: double.infinity,
            //       titleSize: 16,
            //       priceSize: 14,
            //     );
            //   },
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 15,
            //     childAspectRatio: 0.67,
            //   ),
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(currentIndex: 1),
    );
  }
}
