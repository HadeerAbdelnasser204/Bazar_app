import 'package:bazzar_app/core/api/api_service.dart';
import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/Books/data/data_sources/books_remote_data_source.dart';
import 'package:bazzar_app/features/Books/data/repositories/books_repository_impl.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/book_cubit.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/bottom_navigation_Bar_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/homeBody.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final api = ApiService();
final remote = BooksRemoteDataSource(api);
final repo = BooksRepositoryImpl(remote);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        title: 'Home',
        iconPath: AppAssets.notificationIcon,
        leadingIconPath: AppAssets.searchIcon,
        iconOnPressed: () => context.push(AppRoutes.notificationScreen),
      ),

      body: BlocProvider(
        create: (context) => BookCubit(repo)..fetchBooks(),
        child: HomeBody(),
      ),

      bottomNavigationBar: BottomNavigationBarWidget(currentIndex: 0),
    );
  }
}
