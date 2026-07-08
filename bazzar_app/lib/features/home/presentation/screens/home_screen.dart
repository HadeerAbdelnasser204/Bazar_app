import 'package:bazzar_app/core/Di/get_it.dart';
import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/Authors/presentation/cubit/author_cubit.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/book_cubit.dart';
import 'package:bazzar_app/features/Vendors/presentation/cubit/vendor_cubit.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/bottom_navigation_Bar_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/homeBody.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<BookCubit>()..fetchBooks()),

          BlocProvider(create: (context) => sl<VendorCubit>()..fetchVendors()),

          BlocProvider(
            create: (context) => sl<AuthorCubit>()..fetchAuthors("All"),
          ),
        ],
        child: HomeBody(),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(currentIndex: 0),
    );
  }
}
