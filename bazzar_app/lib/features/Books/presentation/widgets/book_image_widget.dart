import 'package:flutter/material.dart';

class BookImageWidget extends StatelessWidget {
  const BookImageWidget({
    super.key,
    required this.imageColor,
    required this.imageName,
  });

  final String imageName;
  final Color imageColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 220,
        height: 280,
        decoration: BoxDecoration(
          color: imageColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(imageName, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
