import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:bazzar_app/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:bazzar_app/features/favorites/presentation/widgets/favorite_book_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.grey500),
          );
        }

        if (state is FavoritesError) {
          return Center(child: Text(state.message));
        }

        if (state is FavoritesLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListView.builder(
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      FavoriteBookSection(book: state.favorites[index]),
                      AppSpacing.h10,
                      Divider(thickness: 1, color: AppColors.grey300),
                    ],
                  ),
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
