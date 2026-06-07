import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/card_option.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeliveryDateSheet extends StatefulWidget {
  const DeliveryDateSheet({super.key});

  @override
  State<DeliveryDateSheet> createState() => _DeliveryDateSheetState();
}

class _DeliveryDateSheetState extends State<DeliveryDateSheet> {
  int selectedDate = 0;
  int selectedTime = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Delivery date',
            style: AppTextStyles.h5,
            textAlign: TextAlign.start,
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: OptionCard(
                  title: 'Today\n12 Jan',
                  selected: selectedDate == 0,
                  onTap: () => setState(() => selectedDate = 0),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OptionCard(
                  title: 'Tomorrow\n12 Jan',
                  selected: selectedDate == 1,
                  onTap: () => setState(() => selectedDate = 1),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Text(
            'Delivery time',
            style: AppTextStyles.h5,
            textAlign: TextAlign.start,
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: OptionCard(
                  title: '10PM - 11PM',
                  selected: selectedTime == 0,
                  onTap: () => setState(() => selectedTime = 0),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OptionCard(
                  title: '11PM - 12PM',
                  selected: selectedTime == 1,
                  onTap: () => setState(() => selectedTime = 1),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            height: 56,
            child: CustomeButton(
              text: "Confirm",
              onPressed: () {
                context.pop();
              },
              buttonColor: AppColors.primary500,
              textColor: AppColors.white,
              borderSide: BorderSide(),
            ),
          ),
        ],
      ),
    );
  }
}
