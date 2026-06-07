import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onPressed,
  });

  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(icon, size: 18, color: iconColor),
      ),
    );
  }
}
