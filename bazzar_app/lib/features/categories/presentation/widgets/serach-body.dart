import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/categories/data/data_sources/dummy_search_history.dart';
import 'package:bazzar_app/features/categories/presentation/widgets/search_text_field_widget.dart';
import 'package:flutter/material.dart';

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
            onSubmitted: (value) {
              setState(() {
                dummySearchHistory.add(value);
              });
              searchController.clear();
            },
          ),
          AppSpacing.h25,

          Text(
            'Recent Searches',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          AppSpacing.h25,

          for (var search in dummySearchHistory.reversed.take(5).toList())
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  search,
                  style: TextStyle(fontSize: 16, color: AppColors.grey500),
                ),
                Divider(color: AppColors.grey100, thickness: 1, height: 25),
              ],
            ),
        ],
      ),
    );
  }
}
