import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/features/categories/data/data_sources/dummy_search_history.dart';
import 'package:bazzar_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:bazzar_app/features/search/presentation/widgets/search_result_builder.dart';
import 'package:bazzar_app/features/search/presentation/widgets/search_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: ListView(
        children: [
          SearchTextFieldWidget(
            searchController: searchController,
            onChanged: (value) {
              if (value.trim().isEmpty) return;

              context.read<SearchCubit>().searchBooks(value);
              // context.read<SearchCubit>().searchBooksByTitle(value);
            },

            onSubmitted: (value) {
              if (value.trim().isEmpty) return;
              context.read<SearchCubit>().searchBooksByTitle(value);
              searchController.clear();
            },
          ),

          AppSpacing.h25,

          SearchResultBuilder(),
        ],
      ),
    );
  }
}
