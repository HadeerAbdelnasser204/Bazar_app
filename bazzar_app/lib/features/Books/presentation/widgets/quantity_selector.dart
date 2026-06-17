// ignore_for_file: must_be_immutable

import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/quantity_cubit.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/quantity_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.minusButtonColor,
    required this.plusButtonColor,
    required this.price,
  });
  final Color minusButtonColor;
  final Color plusButtonColor;
  final double price;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuantityCubit>();

    return BlocBuilder<QuantityCubit, QuantityState>(
      builder: (context, state) {
        return Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: minusButtonColor,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  cubit.decrement();
                },
                icon: const Icon(Icons.remove, size: 20),
              ),
            ),

            const SizedBox(width: 10),
            Text(
              state.quantity.toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: plusButtonColor,
              ),

              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  cubit.increment();
                },
                icon: const Icon(Icons.add, color: AppColors.white, size: 20),
              ),
            ),
            SizedBox(width: 20),
            Text(
              '\$${state.total.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.primary500,
              ),
            ),
          ],
        );
      },
    );
  }
}
