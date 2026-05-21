import 'package:flutter/material.dart';

class PageDescriptionWidget extends StatelessWidget {
  const PageDescriptionWidget({
    super.key,
    required this.description,
    required this.subtitle,
  });
  final String description;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF54408C),
            ),
          ),
        ],
      ),
    );
  }
}
