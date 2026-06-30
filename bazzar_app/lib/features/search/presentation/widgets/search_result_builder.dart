import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/book_widget.dart';
import 'package:bazzar_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:bazzar_app/features/search/presentation/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultBuilder extends StatelessWidget {
  const SearchResultBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Recent Searches',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              AppSpacing.h25,

              for (var search
                  in context.read<SearchCubit>().history.take(5).toList())
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      search,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.grey500,
                      ),
                    ),
                    const Divider(
                      color: AppColors.grey100,
                      thickness: 1,
                      height: 25,
                    ),
                  ],
                ),
            ],
          );
        }

        if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.grey500),
          );
        }

        if (state is SearchSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return BookWidget(
                book: state.books[index],
                width: 180,
                height: 170,
                boxWidth: double.infinity,
                titleSize: 16,
                priceSize: 14,
              );
            },
          );
        }

        if (state is SearchError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
