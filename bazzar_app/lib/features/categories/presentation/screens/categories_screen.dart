import 'package:bazzar_app/core/Di/get_it.dart';
import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:bazzar_app/features/categories/presentation/widgets/category_body.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/bottom_navigation_Bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocProvider(
        create: (context) => sl<CategoryCubit>()..loadInitialData(),
        child: CategoryBody(),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(currentIndex: 1),
    );
  }
}
