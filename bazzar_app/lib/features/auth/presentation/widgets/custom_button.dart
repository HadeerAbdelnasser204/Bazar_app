import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    this.withIcon = false,
    this.icon,
    required this.borderSide,
    this.radius = 48,
  });

  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final bool withIcon;
  final Widget? icon;
  final BorderSide borderSide;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          side: borderSide,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (withIcon && icon != null) ...[icon!, const SizedBox(width: 8)],

            Text(text, style: AppTextStyles.h6.copyWith(color: textColor)),
          ],
        ),
      ),
    );
  }
}
