import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/screens/date&time_sheet.dart';
import 'package:flutter/material.dart';

class BuildDateTimeCard extends StatelessWidget {
  const BuildDateTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.calendar_month)),
        title: Text(
          'Date & time',
          style: AppTextStyles.bodyLarge.copyWith(color: AppColors.grey900),
        ),
        subtitle: Text(
          'Choose date and time',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey600),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
            builder: (_) => const DeliveryDateSheet(),
          );
        },
      ),
    );
  }
}
