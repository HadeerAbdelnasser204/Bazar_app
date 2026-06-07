import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: selected ? AppColors.primary500 : AppColors.grey200,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Text(title, style: AppTextStyles.h6)),
      ),
    );
  }
}
