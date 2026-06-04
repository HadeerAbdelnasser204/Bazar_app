// ignore_for_file: deprecated_member_use

import 'package:bazzar_app/core/constants/app_spacing.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountTextField extends StatefulWidget {
  const AccountTextField({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.suffixIcon,
    this.prefixIcon,
  });

  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final String? suffixIcon;
  final String? prefixIcon;

  @override
  State<AccountTextField> createState() => _AccountTextFieldState();
}

class _AccountTextFieldState extends State<AccountTextField> {
  @override
  void initState() {
    super.initState();
  }

  InputDecoration _decoration() {
    return InputDecoration(
      prefixIcon: widget.prefixIcon != null
          ? Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                widget.prefixIcon!,
                width: 20,
                height: 20,
                color: AppColors.primary500,
              ),
            )
          : null,
      suffixIcon: widget.suffixIcon != null
          ? Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                widget.suffixIcon!,
                width: 20,
                height: 20,
                color: AppColors.grey500,
              ),
            )
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.grey200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.grey200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary500),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red),
      ),
      filled: true,
      fillColor: AppColors.grey50,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        AppSpacing.h10,
        TextFormField(controller: widget.controller, decoration: _decoration()),
      ],
    );
  }
}
