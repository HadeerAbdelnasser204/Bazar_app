import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.backgroundColor,
    required this.title,
    required this.titleColor,
  });

  final VoidCallback? onPressed;
  final Color backgroundColor;
  final String title;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: titleColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
