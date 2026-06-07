import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/location/presentation/widgets/address_info_tile.dart';
import 'package:bazzar_app/features/location/presentation/widgets/address_type_selector.dart';
import 'package:flutter/material.dart';

class DetailAddressSection extends StatelessWidget {
  const DetailAddressSection({
    super.key,
    required this.selectedAddressType,
    required this.onAddressTypeChanged,
  });

  final String selectedAddressType;
  final ValueChanged<String> onAddressTypeChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.grey300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Detail Address', style: AppTextStyles.h5),

                Icon(Icons.my_location, color: AppColors.primary500),
              ],
            ),

            const SizedBox(height: 20),

            const AddressInfoTile(),

            const SizedBox(height: 20),

            Divider(color: AppColors.grey200),

            const SizedBox(height: 20),

            Text(
              'Save Address As',
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.grey900,
              ),
            ),

            const SizedBox(height: 16),

            AddressTypeSelector(
              selectedAddressType: selectedAddressType,
              onChanged: onAddressTypeChanged,
            ),
          ],
        ),
      ),
    );
  }
}
