import 'package:bazzar_app/core/Di/get_it.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:bazzar_app/features/favorites/presentation/widgets/favorite_body.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocProvider(
        create: (context) => sl<FavoritesCubit>()..loadFavorites(),
        child: FavoriteBody(),
      ),
    );
  }
}
