import 'package:flutter/material.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.title,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary500 : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(child: Image.asset(image)),

            const SizedBox(width: 12),

            Expanded(child: Text(title, style: AppTextStyles.bodyLarge)),

            isSelected
                ? Icon(Icons.check_circle, color: AppColors.primary500)
                : const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
