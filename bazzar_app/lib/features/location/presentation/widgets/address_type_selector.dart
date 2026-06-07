import 'package:flutter/material.dart';

class AddressTypeSelector extends StatelessWidget {
  const AddressTypeSelector({
    super.key,
    required this.selectedAddressType,
    required this.onChanged,
  });

  final String selectedAddressType;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChoiceChip(
          label: const Text('Home'),
          selected: selectedAddressType == 'Home',
          onSelected: (_) => onChanged('Home'),
        ),

        const SizedBox(width: 12),

        ChoiceChip(
          label: const Text('Office'),
          selected: selectedAddressType == 'Office',
          onSelected: (_) => onChanged('Office'),
        ),
      ],
    );
  }
}
