import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget({
    super.key,
    required this.searchController,
    required this.onChanged,
    required this.onSubmitted,
  });

  final TextEditingController searchController;
  final Function(String) onChanged;
  final Function(String) onSubmitted;

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.searchController,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: AppColors.grey500, fontSize: 18),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            AppAssets.searchIcon,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(AppColors.grey500, BlendMode.srcIn),
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: AppColors.grey300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: AppColors.grey300),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: AppColors.grey300),
        ),

        filled: true,
        fillColor: AppColors.grey100,
      ),
    );
  }
}
